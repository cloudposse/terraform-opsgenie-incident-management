provider "opsgenie" {
  api_key = var.opsgenie_provider_api_key
}

module "team" {
  source = "../../modules/team"

  team = {
    name        = "owner-team"
    description = "owner-team-description"
  }
}

module "notification_policy" {
  source = "../../modules/notification_policy"

  notification_policy = {
    name    = module.this.id
    team_id = module.team.team_id

    filter = {
      type = "match-all-conditions"
      conditions = [{
        field          = "tags"
        operation      = "contains"
        expected_value = "recommendation:auto-close"
      }]
    }

    auto_close_action = {
      time_unit   = "minutes"
      time_amount = 5
    }
  }
}
