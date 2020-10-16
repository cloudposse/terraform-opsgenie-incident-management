resource "opsgenie_service_incident_rule" "this" {
  for_each = local.service_incident_rules != null ? toset(local.service_incident_rules) : []

  service_id = opsgenie_service.this[each.value.service_name].id

  incident_rule {
    condition_match_type = try(each.value.incident_rule.condition_match_type, "match-all")

    dynamic conditions {
      for_each = try(each.value.incident_rule.conditions, [])

      content {
        expected_value = try(conditions.value.expected_value, null)
        field          = conditions.value.field
        not            = try(conditions.value.not, null)
        operation      = conditions.value.operation
      }
    }

    incident_properties {
      message  = each.value.incident_rule.incident_properties.message
      priority = each.value.incident_rule.incident_properties.priority
      tags     = try(each.value.incident_rule.incident_properties.tags, null)
      details  = try(each.value.incident_rule.incident_properties.details, null)

      stakeholder_properties {
        message     = each.value.incident_rule.incident_properties.stakeholder_properties.message
        description = try(each.value.incident_rule.incident_properties.stakeholder_properties.description, null)
        enable      = try(each.value.incident_rule.incident_properties.stakeholder_properties.enable, null)
      }
    }
  }
}
