resource "opsgenie_alert_policy" "this" {
  count = module.this.enabled ? 1 : 0

  name               = var.alert_policy.name
  policy_description = try(var.alert_policy.description, var.alert_policy.name)
  team_id            = try(var.alert_policy.team_id, null)

  enabled         = try(var.alert_policy.enabled, true)
  continue_policy = try(var.alert_policy.continue, true)

  alias             = try(var.alert_policy.alias, null)
  entity            = try(var.alert_policy.entity, null)
  message           = try(var.alert_policy.message, "{{ message }}")
  priority          = try(var.alert_policy.priority, null)
  source            = try(var.alert_policy.source, null)
  tags              = try(var.alert_policy.tags, null)
  alert_description = try(var.alert_policy.alert_description, "{{ description }}")

  ignore_original_actions    = try(var.alert_policy.ignore_original_actions, false)
  ignore_original_details    = try(var.alert_policy.ignore_original_details, false)
  ignore_original_responders = try(var.alert_policy.ignore_original_responders, false)
  ignore_original_tags       = try(var.alert_policy.ignore_original_tags, false)

  dynamic "responders" {
    for_each = try(var.alert_policy.responders, [])

    content {
      id       = responders.value.id
      name     = try(responders.value.name, null)
      type     = responders.value.type
      username = try(responders.value.username, null)
    }
  }

  filter {
    type = try(var.alert_policy.filter.type, "match-all")

    dynamic "conditions" {
      for_each = try(var.alert_policy.filter.conditions, [])

      content {
        expected_value = try(conditions.value.expected_value, null)
        field          = try(conditions.value.field, null)
        key            = try(conditions.value.key, null)
        not            = try(conditions.value.not, null)
        operation      = try(conditions.value.operation, null)
      }
    }
  }
}
