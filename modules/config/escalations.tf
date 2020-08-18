resource "opsgenie_escalation" "this" {
  for_each = {
    for escalation in var.opsgenie_resources.escalations : escalation.name => escalation
  }

  name        = each.value.name
  description = try(each.value.description, each.value.name)

  # Look up our team id by name
  owner_team_id = try(opsgenie_team.this[each.value.owner_team_name].id, null)

  rules {
    condition   = try(each.value.rule.condition, "if-not-acked")
    notify_type = try(each.value.rule.notify_type, "default")
    delay       = try(each.value.rule.delay, 0)

    dynamic recipient {
      for_each = try(each.value.rule.recipients, [])

      content {
        # Look up our team id by name
        id   = opsgenie_team.this[recipient.value.team_name].id
        type = recipient.value.type
      }
    }
  }
}
