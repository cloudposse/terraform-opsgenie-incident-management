provider "opsgenie" {
  api_key = var.opsgenie_provider_api_key
}

module "alert_policy" {
  source = "../../modules/alert_policy"

  alert_policy = {
    name = module.this.id

    tags     = ["test1", "test2"]
    priority = "P1"

    responders = [
      {
        id   = module.team.team_id
        type = "team"
      }
    ]

    filter = {
      type = "match-all-conditions"
      conditions = [
        {
          field          = "source"
          operation      = "matches"
          expected_value = ".*prod.*"
        },
        {
          field          = "tags"
          operation      = "contains"
          expected_value = "severity:critical"
        }
      ]
    }
  }
}

module "team" {
  source = "../../modules/team"

  team = {
    name        = module.this.id
    description = "team-description"
  }
}
