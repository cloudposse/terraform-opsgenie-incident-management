provider "opsgenie" {
  api_key = var.opsgenie_provider_api_key
}

locals {
  # load the config for each squad individually
  # Temporary variable to hold the config for each squad
  squads_configs = [
    for resource_file in fileset(path.cwd, "squads/*/*.yaml") : {
      for k, v in yamldecode(file(resource_file)) : k => v
    }
  ]

  # Build a map of our various Opsgenie resources that will be used to iterate over each module
  # by "joining" the configs from many squads into a single map
  opsgenie_resources = {
    for key in distinct(flatten([for x in local.squads_configs : keys(x)])) :
    key => flatten([
    for m, n in local.squads_configs : n[key] if keys(n)[0] == key])
  }
}

module "opsgenie_config" {
  source = "../../modules/config"

  opsgenie_resources = local.opsgenie_resources
}
