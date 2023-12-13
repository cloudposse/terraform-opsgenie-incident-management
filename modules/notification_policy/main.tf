resource "opsgenie_notification_policy" "this" {
  count = module.this.enabled ? 1 : 0

  enabled            = try(var.notification_policy.enabled, true)
  name               = var.notification_policy.name
  team_id            = var.notification_policy.team_id
  policy_description = try(var.notification_policy.description, var.notification_policy.name)

  filter {
    type = try(var.notification_policy.filter.type, "match-all")

    dynamic "conditions" {
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

  time_restriction {
    type = try(var.notification_policy.time_restriction.type, null)

    dynamic "restrictions" {
      for_each = try(var.notification_policy.filter.conditions, [])

      content {
        start_day  = try(conditions.value.start_day, null)
        end_day    = try(conditions.value.end_day, null)
        start_hour = try(conditions.value.start_hour, null)
        end_hour   = try(conditions.value.end_hour, null)
        start_min  = try(conditions.value.start_min, null)
        end_min    = try(conditions.value.end_min, null)
      }
    }
  }

  dynamic "de_duplication_action" {
    for_each = try(var.notification_policy.de_duplication_action, null) != null ? ["true"] : []

    content {
      de_duplication_action_type = var.notification_policy.de_duplication_action.de_duplication_action_type
      count                      = var.notification_policy.de_duplication_action.count

      dynamic "duration" {
        for_each = var.notification_policy.de_duplication_action.de_duplication_action_type == "frequency-based" ? ["true"] : [try(var.notification_policy.de_duplication_action.duration, null)]

        content {
          time_amount = var.notification_policy.de_duplication_action.duration.time_amount
          time_unit   = try(var.notification_policy.de_duplication_action.duration.time_unit, null)
        }
      }

      until_hour   = var.notification_policy.delay_action.delay_option != "for-duration" ? var.notification_policy.delay_action.until_hour : null
      until_minute = var.notification_policy.delay_action.delay_option != "for-duration" ? var.notification_policy.delay_action.until_minute : null
    }
  }

  dynamic "delay_action" {
    for_each = try(var.notification_policy.delay_action, null) != null ? ["true"] : []

    content {
      delay_option = var.notification_policy.delay_action.delay_option

      dynamic "duration" {
        for_each = var.notification_policy.delay_action.delay_option == "for-duration" ? ["true"] : []

        content {
          time_amount = var.notification_policy.delay_action.duration.time_amount
          time_unit   = try(var.notification_policy.delay_action.duration.time_unit, null)
        }
      }

      until_hour   = var.notification_policy.delay_action.delay_option != "for-duration" ? var.notification_policy.delay_action.until_hour : null
      until_minute = var.notification_policy.delay_action.delay_option != "for-duration" ? var.notification_policy.delay_action.until_minute : null
    }
  }

  dynamic "auto_close_action" {
    for_each = try(var.notification_policy.auto_close_action, null) != null ? ["true"] : []

    content {
      duration {
        time_amount = var.notification_policy.auto_close_action.duration.time_amount
        time_unit   = var.notification_policy.auto_close_action.duration.time_unit
      }
    }

  }
}
