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
  # Basic identity / placement
  description   = "${var.hostname} (managed by Terraform)"
  node_name     = var.target_node
  vm_id         = var.vmid

  # LXC flags
  unprivileged  = var.unprivileged
  start_on_boot = var.onboot
  started       = true

  # Tags (bpg expects list(string))
  tags = var.tags

  # CPU / cores
  cpu {
    cores = var.cores
  }

  # Memory (MB)
  memory {
    dedicated = var.memory
    swap      = 0
  }

  # Root disk (storage + size)
  disk {
    datastore_id = var.rootfs_storage
    size         = var.rootfs_size
  }

  # OS template (Debian 12 in your case)
  operating_system {
    template_file_id = var.ostemplate
    type             = "debian"
  }

  # Cloud-init-style init: hostname + IP + gateway
  initialization {
    hostname = var.hostname

    ip_config {
      ipv4 {
        address = var.ip_address   # e.g. "192.168.5.51/24"
        gateway = var.gateway      # e.g. "192.168.5.1"
      }
    }
  }

  # Network – keep it minimal, like in the provider examples :contentReference[oaicite:0]{index=0}
  network_interface {
    name = var.network_bridge     # e.g. "vmbr0"
  }

  features {
    nesting = var.enable_docker
    fuse    = var.enable_docker
  }
}

resource "proxmox_virtual_environment_haresource" "this" {
  count = var.ha_enabled ? 1 : 0

  # For containers, resource_id is: ct:<vmid>
  resource_id = "ct:${var.vmid}"
  group       = var.ha_group

  state   = "started"
  comment = "${var.hostname} (HA managed by Terraform)"

  max_relocate = 1
  max_restart  = 3

  depends_on = [
    proxmox_virtual_environment_container.this
  ]
}
