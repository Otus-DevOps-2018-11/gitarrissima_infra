variable project {
  description = "Project ID"
}

variable region {
  description = "Region"
  default     = "europe-west1"
}

variable zone {
  description = "Zone"
  default     = "europe-west1-b"
}

variable private_key_path_test {
  description = "Path to private key"
}

variable public_key_path {
  description = "Path to the public key used for ssh access"
}

variable public_key_path_test2 {
  description = "Path to the public key used for ssh access"
}

variable public_key_path_test3 {
  description = "Path to the public key used for ssh access"
}

variable disk_image {
  description = "Disk image"
}

variable app_disk_image {
  description = "Disk image for reddit app"
  default     = "reddit-app-base"
}

variable db_disk_image {
  description = "Disk image for reddit db"
  default     = "reddit-db-base"
}

variable mongodb {
  description = "Mongodb address"
  default     = "127.0.0.1:27017"
}


