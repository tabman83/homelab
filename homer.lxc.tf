module "homer_lxc" {
  source = "./modules/lxc"

  hostname   = "homer"
  vmid       = 101                # pick a free VMID

  # CHANGE these to your actual values:
  node       = "pve"              # e.g. "pve", "pve2", "pve3"
  ostemplate = "local:vztmpl/debian-12-standard_12.0-1_amd64.tar.zst"  # must exist in Proxmox
  storage    = "ceph-rbd"         # e.g. "local-lvm", "ceph-rbd", ...

  cpu_cores  = 1
  memory_mb  = 512

  bridge     = "vmbr0"            # usually vmbr0, unless you changed it
  ip         = "dhcp"             # or "192.168.5.X/24" if you want static

  tags       = ["homer", "homelab"]
}
