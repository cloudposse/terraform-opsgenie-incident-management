module "alert_policy" {
  source = "../../modules/alert_policy"

  opsgenie_provider_api_key = var.opsgenie_provider_api_key

  alert_policy = {
    name    = module.label.id
    team_id = module.team.team_id
    filter = {
      type = "match-all"
      conditions = [
        {
          field          = "source"
          operation      = "matches"
          expected_value = ".*stage.*"
        },
        {
          field          = "tags"
          operation      = "contains"
          expected_value = "severity:info"
        }
      ]
      priority = "P5"
    }
  }


}
