resource "opsgenie_notification_policy" "this" {
  for_each = module.this.enabled ? { for policy in local.notification_policies : policy.name => policy } : {}

  enabled = try(each.value.enabled, true)
  name    = each.value.name

  # Look up our team id by name
  team_id            = opsgenie_team.this[each.value.team_name].id
  policy_description = try(each.value.description, each.value.name)

  filter {
    type = try(each.value.filter.type, "match-all")

    dynamic "conditions" {
      for_each = try(each.value.filter.conditions, [])

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
      time_amount = try(each.value.auto_close_action.time_amount, null)
      time_unit   = try(each.value.auto_close_action.time_unit, "minutes")
    }
  }
}
