provider "opsgenie" {
  api_key = var.opsgenie_provider_api_key
}

module "label" {
  source = "git::https://github.com/cloudposse/terraform-null-label.git?ref=tags/0.17.0"

  attributes = var.attributes
  delimiter  = var.delimiter
  name       = var.name
  namespace  = var.namespace
  stage      = var.stage
  tags       = var.tags
}

module "escalation_team" {
  source = "../../modules/team"

  team = {
    name        = "escalation-team"
    description = "owner-team-description"
  }

}

module "escalation" {
  source = "../../modules/escalation"

  escalation = {
    name          = "escalation"
    owner_team_id = module.owner_team.team_id

    rule = {
      recipients = [{
        type = "team"
        id   = module.escalation_team.team_id
      }]
    }
  }

}

module "owner_team" {
  source = "../../modules/team"

  team = {
    name        = "owner-team"
    description = "owner-team-description"
  }
}

module "team_routing_rule" {
  source = "../../modules/team_routing_rule"

  team_routing_rule = {
    name    = module.label.id
    team_id = module.owner_team.team_id

    notify = [{
      type = "escalation"
      id   = module.escalation.escalation_id
    }]
  }
}
