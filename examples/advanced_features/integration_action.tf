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
}
