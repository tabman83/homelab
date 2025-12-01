output "deploy_targets" {
  description = "Apps that should be deployed via GitOps pipeline"
  value = {
    homer = {
      vmid    = module.homer_lxc.vmid
      app_dir = "services/${module.homer_lxc.hostname}"
    }

    # later you'll add more, e.g.:
    # npm = {
    #   vmid    = module.npm_lxc.vmid
    #   app_dir = "npm"
    # }
  }
}
