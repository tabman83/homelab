terraform {
  required_providers {
    proxmox = {
      source  = "bpg/proxmox"
      version = "~> 0.66"
    }
  }
}

resource "proxmox_lxc" "this" {
  hostname     = var.hostname
  vmid         = var.vmid
  target_node  = var.node

  ostemplate   = var.ostemplate
  unprivileged = true
  onboot       = true

  cores   = var.cpu_cores
  memory  = var.memory_mb
  swap    = 0

  rootfs {
    storage = var.storage
    size    = var.disk_size
  }

  network {
    name   = "eth0"
    bridge = var.bridge
    ip     = var.ip
    ip6    = "auto"
  }

  tags = length(var.tags) > 0 ? join(";", var.tags) : null
}
