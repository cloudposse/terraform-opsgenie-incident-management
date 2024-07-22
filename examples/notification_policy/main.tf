provider "opsgenie" {
  api_key = var.opsgenie_provider_api_key
}

module "team" {
  source = "../../modules/team"

  team = {
    name        = "notification-policy-owner-team"
    description = "owner-team-description"
  }

  context = module.this.context
}

module "notification_policy" {
  source = "../../modules/notification_policy"

  notification_policy = {
    name    = module.this.id
    team_id = module.team.team_id

    filter = {
      type       = "match-all-conditions"
      conditions = [
        {
          field          = "tags"
          operation      = "contains"
          expected_value = "recommendation:auto-close"
        }
      ]
    }

    de_duplication_action = var.de_duplication_action
    delay_action          = var.delay_action

    auto_close_action = {
      duration = {
        time_unit   = "minutes"
        time_amount = 5
      }
    }

    auto_restart_action = {
      duration = {
        time_unit   = "minutes"
        time_amount = 5
      }
      max_repeat_count = 3
    }

    suppress = false
  }

  context = module.this.context
}
