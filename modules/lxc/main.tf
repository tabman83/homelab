// modules/lxc/main.tf

terraform {
  required_providers {
    proxmox = {
      source  = "bpg/proxmox"
      version = "~> 0.66"
    }
  }
}

resource "proxmox_virtual_environment_container" "this" {
  # Rough equivalent of Telmate's:
  #   hostname, target_node, vmid, unprivileged, onboot, tags

  description   = "${var.hostname} (managed by Terraform)"
  node_name     = var.target_node
  vm_id         = var.vmid

  unprivileged  = var.unprivileged
  start_on_boot = var.onboot
  started       = true

  # bpg expects a list of tags
  tags = var.tags

  # CPU / cores (Telmate: cores)
  cpu {
    cores = var.cores
  }

  # Memory in MB (Telmate: memory, swap)
  memory {
    dedicated = var.memory
    swap      = 0
  }

  # Root disk (Telmate: rootfs { storage, size })
  disk {
    datastore_id = var.rootfs_storage
    size         = var.rootfs_size
  }

  # OS template (Telmate: ostemplate = "local:vztmpl/…")
  # For Homer you're likely using a Debian/Ubuntu template;
  # adjust type if needed (e.g. "ubuntu", "alpine", etc.)
  operating_system {
    template_file_id = var.ostemplate
    type             = "debian"
  }

  # Initialization block holds hostname + IP config (instead of Telmate's network/ip/gw)
  initialization {
    hostname = var.hostname

    ip_config {
      ipv4 {
        address = var.ip_address   # e.g. "192.168.5.50/24"
        gateway = var.gateway      # e.g. "192.168.5.1"
      }
    }
  }

  # Network interface – here we just specify the bridge.
  # In practice this is equivalent to Telmate's "bridge = vmbr0".
  network_interface {
    name = var.network_bridge      # e.g. "vmbr0"
  }
}
