// modules/lxc/variables.tf

variable "hostname" {
  type = string
}

variable "vmid" {
  type = number
}

variable "target_node" {
  type = string
}

variable "ostemplate" {
  # e.g. "local:vztmpl/debian-12-standard_12.2-1_amd64.tar.zst"
  type = string
}

variable "unprivileged" {
  type    = bool
  default = true
}

variable "onboot" {
  type    = bool
  default = true
}

variable "cores" {
  type = number
}

variable "memory" {
  # MB
  type = number
}

variable "rootfs_storage" {
  # Proxmox datastore name, e.g. "ceph-rbd", "local-lvm"
  type = string
}

variable "rootfs_size" {
  # bpg accepts string/number; string keeps it explicit, e.g. "20"
  type = string
}

variable "ip_address" {
  # With CIDR, e.g. "192.168.5.50/24"
  type = string
}

variable "gateway" {
  type = string
}

variable "network_bridge" {
  # e.g. "vmbr0"
  type = string
}

variable "tags" {
  # bpg expects list(string)
  type    = list(string)
  default = []
}

variable "ha_enabled" {
  description = "Whether this LXC should be managed by Proxmox HA"
  type        = bool
  default     = false
}

variable "ha_group" {
  description = "Name of the Proxmox HA group to use (required if ha_enabled = true)"
  type        = string
  default     = ""
}
