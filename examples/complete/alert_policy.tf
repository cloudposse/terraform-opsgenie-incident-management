module "alert_policy" {
  source = "../../modules/alert_policy"

  alert_policy = {
    name    = module.this.id
    team_id = module.team.team_id
    filter = {
      type = "match-all"
      conditions = [
        {
          # Possible values are "message", "alias", "description", "source", "entity", "tags", "actions", "details", "extra-properties", "recipients", "teams", "priority"
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
