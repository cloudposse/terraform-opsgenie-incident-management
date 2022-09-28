resource "opsgenie_team_routing_rule" "this" {
  for_each = module.this.enabled ? { for rule in local.team_routing_rules : rule.name => rule } : tomap()

  name = each.value.name

  # Look up Team ID by name
  team_id = opsgenie_team.this[each.value.owner_team_name].id

  order    = try(each.value.order, 0)
  timezone = try(each.value.timezone, "America/Los_Angeles")

  dynamic "criteria" {
    for_each = try(each.value.criteria, null) != null ? ["true"] : []

    content {
      type = lookup(each.value.criteria, "type", "match-all")

      dynamic "conditions" {
        for_each = lookup(each.value.criteria, "conditions", [])

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
  }

  dynamic "notify" {
    for_each = try(each.value.notify, [])

    content {
      type = notify.value.type
      id   = opsgenie_escalation.this[notify.value.name].id
    }
  }
}
