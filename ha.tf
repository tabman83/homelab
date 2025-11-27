resource "proxmox_virtual_environment_hagroup" "homelab" {
  group   = "homelab-ha"
  comment = "Homelab HA group"

  # You can tweak priorities later (higher number = more preferred).
  nodes = {
    pve  = 1
    pve1 = 1
    pve2 = 1
  }

  # If true, Proxmox will NOT automatically fail back to a higher-priority node
  # after a failure. We keep it false so it can move back.
  no_failback = false

  # If true, resources in this group may *only* run on the nodes listed here.
  # Since we list all 3 homelab nodes, false is fine too.
  restricted = false
}
