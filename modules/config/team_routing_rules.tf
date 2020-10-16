resource "opsgenie_team_routing_rule" "this" {
  for_each = {
    for rule in local.team_routing_rules : rule.name => rule
  }

  name = each.value.name

  # Look up our team id by name
  team_id  = opsgenie_team.this[each.value.owner_team_name].id
  order    = try(each.value.order, 0)
  timezone = try(each.value.timezone, "America/Los_Angeles")

  criteria {
    type = try(each.value.criteria.type, "match-all")

    dynamic conditions {
      for_each = try(each.value.criteria.conditions, [])

      content {
        expected_value = try(conditions.value.expected_value, null)
        field          = try(conditions.value.field, null)
        key            = try(conditions.value.key, null)
        not            = try(conditions.value.not, null)
        operation      = try(conditions.value.operation, null)
      }
    }
  }

  dynamic notify {
    for_each = try(each.value.notify, [])

    content {
      # Look up our escalation id by name
      id   = opsgenie_escalation.this[notify.value.name].id
      type = notify.value.type
    }
  }
}
