terraform {
  required_version = ">= 1.6.0"

  required_providers {
    proxmox = {
      source  = "Telmate/proxmox"
      version = "2.9.14"
    }
  }
}

provider "proxmox" {
  # Credentials come from environment variables:
  #   PM_API_URL
  #   PM_API_TOKEN_ID
  #   PM_API_TOKEN_SECRET
}
