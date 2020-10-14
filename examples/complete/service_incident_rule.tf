module "service_incident_rule" {
  source = "../../modules/service_incident_rule"

  service_incident_rule = {
    service_id = module.service.service_id

    incident_rule = {
      condition_match_type = "match-all"

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
}
