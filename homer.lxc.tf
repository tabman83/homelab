module "homer_lxc" {
  source = "./modules/lxc"

  hostname        = "homer"
  vmid            = 110
  target_node     = "pve"
  ostemplate      = "local:vztmpl/debian-13-standard_13.1-2_amd64.tar.zst"
  unprivileged    = false
  onboot          = true
  cores           = 1
  memory          = 1024
  rootfs_storage  = "ceph-rbd-homelab"
  rootfs_size     = "5"
  ip_address      = "192.168.5.51/24"
  gateway         = "192.168.5.1"
  network_bridge  = "vmbr0"
  tags            = ["homer", "gitops"]
  ha_enabled      = true
  ha_group        = proxmox_virtual_environment_hagroup.homelab.group
  enable_docker   = true
}
