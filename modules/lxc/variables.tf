variable "hostname" {
  description = "LXC hostname"
  type        = string
}

variable "vmid" {
  description = "Unique VMID for this container"
  type        = number
}

variable "node" {
  description = "Proxmox node name (e.g. pve, pve2)"
  type        = string
}

variable "ostemplate" {
  description = "LXC template (e.g. local:vztmpl/debian-12-standard_12.0-1_amd64.tar.zst)"
  type        = string
}

variable "storage" {
  description = "Storage ID for rootfs (e.g. ceph-rbd, local-lvm)"
  type        = string
}

variable "disk_size" {
  description = "Root disk size (e.g. 8G)"
  type        = string
  default     = "8G"
}

variable "cpu_cores" {
  description = "Number of CPU cores"
  type        = number
  default     = 1
}

variable "memory_mb" {
  description = "RAM in MB"
  type        = number
  default     = 512
}

variable "bridge" {
  description = "Network bridge name (e.g. vmbr0)"
  type        = string
}

variable "ip" {
  description = "IPv4 address configuration (e.g. dhcp or 192.168.5.50/24)"
  type        = string
  default     = "dhcp"
}

variable "tags" {
  description = "Optional Proxmox tags"
  type        = list(string)
  default     = []
}
