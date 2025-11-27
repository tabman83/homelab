terraform {
  required_version = ">= 1.6.0"

  cloud {
    organization = "tabman83"

    workspaces {
      name    = "homelab-proxmox"
      project = "Homelab"
    }
  }

  required_providers {
    proxmox = {
      source  = "bpg/proxmox"
      # Pick a reasonably recent version; 0.66.x is common in examples
      version = "~> 0.66"
    }
  }
}

# bpg/proxmox provider – reads credentials from env vars:
#   PROXMOX_VE_ENDPOINT   (e.g. "https://pve.yourdomain:8006/")
#   PROXMOX_VE_API_TOKEN  (e.g. "terraform@pve!ci-token=xxxxxxxx")
provider "proxmox" {
  # self-signed cert in homelab, so:
  insecure = true
}
