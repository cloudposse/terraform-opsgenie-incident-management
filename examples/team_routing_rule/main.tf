provider "opsgenie" {
  api_key = var.opsgenie_provider_api_key
}

module "escalation_team" {
  source = "../../modules/team"

  team = {
    name        = module.this.id
    description = "escalation-team-description"
  }

  context = module.this.context
}

module "escalation" {
  source = "../../modules/escalation"

  escalation = {
    name          = module.this.id
    owner_team_id = module.owner_team.team_id

    rules = [{
      recipient = {
        type = "team"
        id   = module.escalation_team.team_id
      }
    }]
  }

  context = module.this.context
}

module "owner_team" {
  source = "../../modules/team"

  team = {
    name        = format("%s-%s", module.this.id, "owner-team")
    description = "owner-team-description"
  }

  context = module.this.context
}

module "team_routing_rule" {
  source = "../../modules/team_routing_rule"

  team_routing_rule = {
    name    = module.this.id
    team_id = module.owner_team.team_id

    notify = [
      {
        type = "escalation"
        id   = module.escalation.escalation_id
      }
    ]

    time_restriction = {
      type = "time-of-day"
      restrictions = [
        {
          end_hour   = 17
          end_min    = 0
          start_hour = 9
          start_min  = 0
        }
      ]
    }
  }

  context = module.this.context
}
