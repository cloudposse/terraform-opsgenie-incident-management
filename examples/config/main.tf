provider "opsgenie" {
  api_key = var.opsgenie_provider_api_key
}

locals {
  #  # Build a map of our various Opsgenie resources that will be used to iterate over each module
  #  opsgenie_resources = merge([
  #    for resource_file in fileset(path.cwd, "resources/*.yaml") : {
  #      for k, v in yamldecode(file(resource_file)) : k => v
  #    }
  #  ]...)

  context_tags = merge({
    for k, v in module.this.tags :
    lower(k) => v
    },
    {
      "platform" : try(module.this.attributes[0], "none"),
  })
}


module "local_datadog_monitors_yaml_config" {
  source  = "cloudposse/config/yaml"
  version = "1.0.2"

  map_config_local_base_path = abspath(path.module)
  map_config_paths           = ["resources/*.yaml"]

  parameters = merge(
    local.context_tags,
  )

  context = module.this.context
}

module "opsgenie_config" {
  source = "../../modules/config"

  opsgenie_resources = module.local_datadog_monitors_yaml_config.map_configs

  context = module.this.context
}
