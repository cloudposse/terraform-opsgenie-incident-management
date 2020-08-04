module "team" {
  source = "../../modules/team"

  provider_api_key = var.opsgenie_provider_api_key

  team = {
    name        = module.label.id
    description = "team-description"
  }
}

module "sub_team" {
  source = "../../modules/team"

  provider_api_key = var.opsgenie_provider_api_key

  team = {
    name        = "${module.label.id}.team"
    description = "sub-team-description"
  }
}
