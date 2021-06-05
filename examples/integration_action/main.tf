provider "opsgenie" {
  api_key = var.opsgenie_provider_api_key
}

module "team" {
  source = "../../modules/team"

  team = {
    name = module.this.id
  }
}

module "api_integration" {
  source = "../../modules/api_integration"

  api_integration = {
    name          = module.this.id
    type          = "AmazonSns"
    owner_team_id = module.team.team_id
  }
}

module "integration_action" {
  source = "../../modules/integration_action"

  integration_action = {
    integration_id = module.api_integration.api_integration_id

    create = [
      {
        name = "Create Non-informational Alerts"
        filter = {
          type = "match-any-condition"
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
}
