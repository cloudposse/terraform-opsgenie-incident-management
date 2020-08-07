provider "opsgenie" {
  api_key = var.opsgenie_provider_api_key
  api_url = var.opsgenie_provider_api_url
}

variable "notification_policy" {
  default     = {}
  description = "This variable is used to configure Opsgenie Notification Policy."
}

resource "opsgenie_notification_policy" "this" {
  enabled            = try(var.notification_policy.enabled, true)
  name               = var.notification_policy.name
  team_id            = var.notification_policy.team_id
  policy_description = try(var.notification_policy.description, var.notification_policy.name)

  filter {
    type = try(var.notification_policy.filter.type, "match-all")

    dynamic conditions {
      for_each = try(var.notification_policy.filter.conditions, [])

      content {
        expected_value = try(conditions.value.expected_value, null)
        field          = try(conditions.value.field, null)
        key            = try(conditions.value.key, null)
        not            = try(conditions.value.not, null)
        operation      = try(conditions.value.operation, null)
        order          = try(conditions.value.order, null)
      }
    }
  }

  auto_close_action {
    duration {
      time_amount = try(var.notification_policy.auto_close_action.time_amount, null)
      time_unit   = try(var.notification_policy.auto_close_action.time_unit, null)
    }
  }
}
