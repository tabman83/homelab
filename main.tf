terraform {
  required_version = ">= 1.6.0"

  required_providers {
    proxmox = {
      proxmox = {
      source  = "Telmate/proxmox"
      version = "2.9.14"  # optional but good to pin since init picked this
    }
  }
}

# Proxmox provider – credentials come from environment variables:
#   PM_API_URL
#   PM_API_TOKEN_ID
#   PM_API_TOKEN_SECRET
provider "proxmox" {
  # Leaving all attributes empty tells the provider to read from env vars.
  # Your GitHub Actions workflow already sets these env vars.
}
