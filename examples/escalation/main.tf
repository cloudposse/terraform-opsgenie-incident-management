provider "opsgenie" {
  api_key = var.opsgenie_provider_api_key
}

module "owner_team" {
  source = "../../modules/team"

  team = {
    name        = format("%s-%s", module.this.id, "owner-team")
    description = "owner-team-description"
  }

  context = module.this.context
}

module "escalation_team" {
  source = "../../modules/team"

  team = {
    name        = format("%s-%s", module.this.id, "escalation-team")
    description = "owner-team-description"
  }

  context = module.this.context
}

module "escalation" {
  source = "../../modules/escalation"

  escalation = {
    name          = module.this.id
    owner_team_id = module.owner_team.team_id

    rule = {
      recipient = {
        type = "team"
        id   = module.escalation_team.team_id
      }
    }
  }

  context = module.this.context
}
