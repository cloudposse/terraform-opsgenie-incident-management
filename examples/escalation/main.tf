module "label" {
  source = "git::https://github.com/cloudposse/terraform-null-label.git?ref=tags/0.16.0"

  attributes = var.attributes
  delimiter  = var.delimiter
  name       = var.name
  namespace  = var.namespace
  stage      = var.stage
  tags       = var.tags
}

module "owner_team" {
  source = "../../modules/team"

  provider_api_key = var.opsgenie_provider_api_key

  team = {
    name        = "owner-team"
    description = "test-description"
  }


}

module "escalation_team" {
  source = "../../modules/team"

  provider_api_key = var.opsgenie_provider_api_key

  team = {
    name        = "escalation-team"
    description = "test-description"
  }

}

module "escalation" {
  source = "../../modules/escalation"

  opsgenie_provider_api_key = var.opsgenie_provider_api_key

  escalation = {
    name          = module.label.id
    owner_team_id = module.owner_team.team_id

    rule = {
      recipients = [{
        type = "team"
        id   = module.escalation_team.team_id
      }]
    }
  }

}
