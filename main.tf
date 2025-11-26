terraform {
  required_version = ">= 1.6.0"

  required_providers {
    proxmox = {
      source = "telmate/proxmox"
      # version = "~> 3.0" # optional pin, you can uncomment later
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
