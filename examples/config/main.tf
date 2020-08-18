provider "opsgenie" {
  api_key = var.opsgenie_provider_api_key
}

locals {
  # Build a map of our various Opsgenie resources that will be used to iterate over each module
  opsgenie_resources = merge([
    for resource_file in fileset(path.cwd, "resources/*.yaml") : {
      for k, v in yamldecode(file(resource_file)) : k => v
    }
  ]...)
}

module "opsgenie_config" {
  source = "../../modules/config"

  opsgenie_resources = local.opsgenie_resources
}

