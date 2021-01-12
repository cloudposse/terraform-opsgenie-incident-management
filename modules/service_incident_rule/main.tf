resource "opsgenie_service_incident_rule" "this" {
  count = module.this.enabled ? 1 : 0

  service_id = var.service_incident_rule.service_id

  incident_rule {
    condition_match_type = try(var.service_incident_rule.incident_rule.condition_match_type, "match-all")

    dynamic "conditions" {
      for_each = try(var.service_incident_rule.incident_rule.conditions, [])

      content {
        expected_value = try(conditions.value.expected_value, null)
        field          = conditions.value.field
        not            = try(conditions.value.not, null)
        operation      = conditions.value.operation
      }
    }

    incident_properties {
      message  = var.service_incident_rule.incident_rule.incident_properties.message
      priority = var.service_incident_rule.incident_rule.incident_properties.priority
      tags     = try(var.service_incident_rule.incident_rule.incident_properties.tags, null)
      details  = try(var.service_incident_rule.incident_rule.incident_properties.details, null)

      stakeholder_properties {
        message     = var.service_incident_rule.incident_rule.incident_properties.stakeholder_properties.message
        description = try(var.service_incident_rule.incident_rule.incident_properties.stakeholder_properties.description, null)
        enable      = try(var.service_incident_rule.incident_rule.incident_properties.stakeholder_properties.enable, null)
      }
    }
  }
}
