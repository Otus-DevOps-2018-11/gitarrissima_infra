variable zone {
  description = "Zone"
  default     = "europe-west1-b"
}

variable public_key_path {
  description = "Path to the public key used for ssh access"
}

variable app_disk_image {
  description = "Disk image"
  default     = "reddit-app-base"
}

variable mongodb {
  description = "Mongodb address"
  default = "127.0.0.1:27017"
}

variable private_key_path {
  description = "Private key path"
}

variable source_files {
  description = "Module source files"
}

