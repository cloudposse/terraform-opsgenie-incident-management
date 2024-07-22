module "service_incident_rule" {
  source = "../../modules/service_incident_rule"

  # Services are Opsgenie Enterprise feature, disable it for now
  enabled = false

  service_incident_rule = {
    service_id = module.service.service_id

    incident_rule = {
      condition_match_type = "match-all"

      conditions = [
        {
          # Possibke values: message, description, tags, extra-properties, recipients, teams, priority
          field          = "message"
          operation      = "matches"
          expected_value = ".*stage.*"
        },
        {
          field          = "tags"
          operation      = "contains"
          expected_value = "severity:info"
        }
      ]

      incident_properties = {
        message  = "This is a test message"
        priority = "P3"

        stakeholder_properties = {
          message = "Message for stakeholders"
          enable  = true
        }
      }
    }
  }

  context = module.this.context
}
