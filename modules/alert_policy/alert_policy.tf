variable "alert_policy" {
  description = "This variable is used to configure Opsgenie Alert Policy."
  default     = {}
}

resource "opsgenie_alert_policy" "this" {
  name               = var.alert_policy.name
  policy_description = try(var.alert_policy.description, var.alert_policy.name)
  team_id            = try(var.alert_policy.team_id, null)

  enabled = try(var.alert_policy.enabled, true)
  # Documentation is wrong and continue field is continue_policy
  # https://github.com/terraform-providers/terraform-provider-opsgenie/blob/a6dc715dd0a32d8db5770228ad14aab41523bd1f/opsgenie/resource_alert_policy.go#L188-L192
  continue_policy = try(var.alert_policy.continue, true)

  alias    = try(var.alert_policy.alias, null)
  entity   = try(var.alert_policy.entity, null)
  message  = try(var.alert_policy.message, "{{ message }}")
  priority = try(var.alert_policy.priority, null)
  source   = try(var.alert_policy.source, null)
  tags     = try(var.alert_policy.tags, null)

  ignore_original_actions    = try(var.alert_policy.ignore_original_actions, false)
  ignore_original_details    = try(var.alert_policy.ignore_original_details, false)
  ignore_original_responders = try(var.alert_policy.ignore_original_responders, false)
  ignore_original_tags       = try(var.alert_policy.ignore_original_tags, false)

  dynamic responders {
    for_each = try(var.alert_policy.responders, [])

    content {
      id       = try(responders.value.id, null)
      name     = try(responders.value.name, null)
      username = try(responders.value.username, null)
      type     = responders.value.type
    }
  }

  filter {
    type = try(var.alert_policy.filter.type, "match-all")

    dynamic conditions {
      for_each = try(var.alert_policy.filter.conditions, [])

      content {
        field          = try(conditions.value.field, null)
        operation      = try(conditions.value.operation, null)
        expected_value = try(conditions.value.expected_value, null)
        key            = try(conditions.value.key, null)
        not            = try(conditions.value.not, null)
      }
    }
  }
}
