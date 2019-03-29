provider "google" {
  version = "1.4.0"
  project = "infra-227420"
  region  = "europe-west1"
}

resource "google_compute_instance_template" "test" {
  name        = "lb-template"
  description = "This template is used to create app server instances."

  machine_type = "g1-small"

  disk {
    source_image = "${var.disk_image}"
    auto_delete  = true
    boot         = true
  }

  network_interface {
    network       = "default"
    access_config = {}
  }

  tags = ["reddit-app"]
}

resource "google_compute_instance_group_manager" "appserver" {
  name = "lm-igm"

  base_instance_name = "app"
  instance_template  = "${google_compute_instance_template.test.self_link}"
  update_strategy    = "NONE"
  zone               = "europe-west1-b"

  target_size = "${var.count}"

  named_port {
    name = "http"
    port = 9292
  }
}

resource "google_compute_backend_service" "website" {
  name        = "lb-backend"
  description = "Our company website"
  protocol    = "HTTP"
  timeout_sec = 10

  backend {
    group = "${google_compute_instance_group_manager.appserver.instance_group}"
  }

  health_checks = ["${google_compute_http_health_check.default.self_link}"]
}

resource "google_compute_http_health_check" "default" {
  name               = "lb-health"
  port               = 9292
  request_path       = "/"
  check_interval_sec = 1
  timeout_sec        = 1
}

resource "google_compute_global_forwarding_rule" "default" {
  name       = "lb-rule"
  target     = "${google_compute_target_http_proxy.default.self_link}"
  port_range = "80"
}

resource "google_compute_target_http_proxy" "default" {
  name        = "lb-proxy"
  description = "a description"
  url_map     = "${google_compute_url_map.default.self_link}"
}

resource "google_compute_url_map" "default" {
  name            = "lb-map"
  description     = "a description"
  default_service = "${google_compute_backend_service.website.self_link}"

  host_rule {
    hosts        = ["*"]
    path_matcher = "allpaths"
  }

  path_matcher {
    name            = "allpaths"
    default_service = "${google_compute_backend_service.website.self_link}"

    path_rule {
      paths   = ["/*"]
      service = "${google_compute_backend_service.website.self_link}"
    }
  }
}
