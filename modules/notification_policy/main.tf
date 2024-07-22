resource "opsgenie_notification_policy" "this" {
  count = module.this.enabled ? 1 : 0

  enabled = try(var.notification_policy.enabled, true)
  name    = var.notification_policy.name

  # Look up our team id by name
  team_id            = var.notification_policy.team_id
  policy_description = try(var.notification_policy.description, var.notification_policy.name)

  filter {
    type = try(var.notification_policy.filter.type, "match-all")

    dynamic "conditions" {
      for_each = try(var.notification_policy.filter.conditions, [])

      content {
        field          = conditions.value.field
        operation      = conditions.value.operation
        expected_value = try(conditions.value.expected_value, "")
        key            = try(conditions.value.key, null)
        not            = try(conditions.value.not, false)
        order          = try(conditions.value.order, null)
      }
    }
  }

  dynamic "time_restriction" {
    for_each = try(var.notification_policy.time_restriction, null) != null ? [var.notification_policy.time_restriction] : []

    content {
      type = time_restriction.value.type

      dynamic "restrictions" {
        for_each = try(time_restriction.value.restrictions, null) != null ? [time_restriction.value.restrictions] : []

        content {
          start_day  = restrictions.value.start_day
          end_day    = restrictions.value.end_day
          start_hour = restrictions.value.start_hour
          end_hour   = restrictions.value.end_hour
          start_min  = restrictions.value.start_min
          end_min    = restrictions.value.end_min
        }
      }

      dynamic "restriction" {
        for_each = try(time_restriction.value.restriction, null) != null ? [time_restriction.value.restriction] : []

        content {
          start_hour = restriction.value.start_hour
          end_hour   = restriction.value.end_hour
          start_min  = restriction.value.start_min
          end_min    = restriction.value.end_min
        }
      }
    }
  }

  dynamic "auto_close_action" {
    for_each = try(var.notification_policy.auto_close_action, null) != null ? [var.notification_policy.auto_close_action] : []

    content {
      duration {
        time_amount = auto_close_action.value.duration.time_amount
        time_unit   = try(auto_close_action.value.duration.time_unit, "minutes")
      }
    }

  }

  dynamic "auto_restart_action" {
    for_each = try(var.notification_policy.auto_restart_action, null) != null ? [var.notification_policy.auto_restart_action] : []

    content {
      duration {
        time_amount = auto_restart_action.value.duration.time_amount
        time_unit   = try(auto_restart_action.value.duration.time_unit, "minutes")
      }
      max_repeat_count = auto_restart_action.value.max_repeat_count
    }

  }

  dynamic "de_duplication_action" {
    for_each = try(var.notification_policy.de_duplication_action, null) != null ? [var.notification_policy.de_duplication_action] : []

    content {
      de_duplication_action_type = de_duplication_action.value.de_duplication_action_type
      count                      = de_duplication_action.value.count

      dynamic "duration" {
        for_each = de_duplication_action.value.de_duplication_action_type == "frequency-based" ? [de_duplication_action.value.duration] : [try(de_duplication_action.value.duration, null)]

        content {
          time_amount = duration.value.time_amount
          time_unit   = try(duration.value.time_unit, "minutes")
        }
      }
    }
  }

  dynamic "delay_action" {
    for_each = try(var.notification_policy.delay_action, null) != null ? [var.notification_policy.delay_action] : []

    content {
      delay_option = delay_action.value.delay_option

      dynamic "duration" {
        for_each = delay_action.value.delay_option == "for-duration" ? [delay_action.value.duration] : []

        content {
          time_amount = duration.value.time_amount
          time_unit   = try(duration.value.time_unit, "minutes")
        }
      }

      until_hour   = delay_action.value.delay_option != "for-duration" ? delay_action.value.until_hour : null
      until_minute = delay_action.value.delay_option != "for-duration" ? delay_action.value.until_minute : null
    }
  }

  suppress = try(var.notification_policy.suppress, null)
}
