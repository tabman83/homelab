output "deploy_targets" {
  description = "Apps that should be deployed via GitOps pipeline"
  value = {
    homer = {
      vmid    = module.homer_lxc.vmid
      app_dir = "homer"
    }

    # later you'll add more, e.g.:
    # npm = {
    #   vmid    = module.npm_lxc.vmid
    #   app_dir = "npm"
    # }
  }
}
