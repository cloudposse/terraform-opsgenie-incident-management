provider "opsgenie" {
  api_key = var.opsgenie_provider_api_key
}

module "team" {
  source = "../../modules/team"

  team = {
    name = module.this.id
  }

  context = module.this.context
}

module "api_integration" {
  source = "../../modules/api_integration"

  api_integration = {
    name          = module.this.id
    type          = "AmazonSns"
    owner_team_id = module.team.team_id
  }

  context = module.this.context
}

module "integration_action" {
  source = "../../modules/integration_action"

  integration_action = {
    integration_id = module.api_integration.api_integration_id
    team_id        = module.team.team_id

    create = [
      {
        name  = "Create Non-informational Alerts"
        alias = "{{title}}"
        filter = {
          type = "match-all-conditions"
          conditions = [
            {
              field          = "priority"
              not            = true
              operation      = "equals"
              expected_value = "P5"
            }
          ]
        }
      }
    ]
  }

  context = module.this.context
}
