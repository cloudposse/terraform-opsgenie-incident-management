module "notification_policy" {
  source = "../../modules/notification_policy"

  notification_policy = {
    name    = module.this.id
    team_id = module.sub_team.team_id

    filter = {
      type = "match-any-condition"
      conditions = [
        {
          field          = "tags"
          operation      = "contains"
          expected_value = "recommendation:auto-close"
        },
        {
          field          = "priority"
          operation      = "equals"
          expected_value = "P5"
        }
      ]
    }

    auto_close_action = {
      time_unit   = "minutes"
      time_amount = 5
    }
  }
}
