resource "opsgenie_team_routing_rule" "this" {
  count = module.this.enabled ? 1 : 0

  name    = var.team_routing_rule.name
  team_id = var.team_routing_rule.team_id
  order   = try(var.team_routing_rule.order, 5)

  timezone = try(var.team_routing_rule.timezone, "America/Los_Angeles")
  dynamic "time_restriction" {
    for_each = [for time_restriction in try([var.team_routing_rule.time_restriction], []) : time_restriction if time_restriction != null]

    content {
      # NOTE: The Opsgenie terraform provider appears to be inconsistent with how it uses time_restriction:
      # `restrictions` for type `weekday-and-time-of-day`
      # `restriction` for type `time-of-day`
      type = var.team_routing_rule.time_restriction.type
      dynamic "restrictions" {
        for_each = var.team_routing_rule.time_restriction.type == "weekday-and-time-of-day" ? try(var.team_routing_rule.time_restriction.restrictions, []) : []
        content {
          start_hour = restrictions.value.start_hour
          start_min  = restrictions.value.start_min
          start_day  = restrictions.value.start_day
          end_hour   = restrictions.value.end_hour
          end_min    = restrictions.value.end_min
          end_day    = restrictions.value.end_day
        }
      }

      dynamic "restriction" {
        for_each = var.team_routing_rule.time_restriction.type == "time-of-day" ? try(var.team_routing_rule.time_restriction.restrictions, []) : []
        content {
          start_hour = restriction.value.start_hour
          start_min  = restriction.value.start_min
          end_hour   = restriction.value.end_hour
          end_min    = try(restriction.value.end_min, 00)
        }
      }
    }
  }

  criteria {
    type = try(var.team_routing_rule.criteria.type != null ? var.team_routing_rule.criteria.type : "match-all", "match-all")

    dynamic "conditions" {
      for_each = try(var.team_routing_rule.criteria.conditions != null ? var.team_routing_rule.criteria.conditions : [], [])

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

  dynamic "notify" {
    for_each = try(var.team_routing_rule.notify, [])

    content {
      type = notify.value.type
      # name and id parameters are mutually exclusive
      id   = try(notify.value.id, null)
      name = try(notify.value.name, null)
    }
  }
}
