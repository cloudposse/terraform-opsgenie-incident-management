module "team" {
  source = "../../modules/team"

  opsgenie_provider_api_key = var.opsgenie_provider_api_key

  team = {
    name           = module.label.id
    description    = "team-description"
    ignore_members = var.ignore_members
  }
}

module "sub_team" {
  source = "../../modules/team"

  opsgenie_provider_api_key = var.opsgenie_provider_api_key

  team = {
    name        = "${module.label.id}.team"
    description = "sub-team-description"
  }
}
