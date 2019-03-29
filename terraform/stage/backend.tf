terraform {
  backend "gcs" {
    bucket = "anna1"
    prefix = "terraform/state"
  }
}
