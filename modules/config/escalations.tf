resource "opsgenie_escalation" "this" {
  for_each = {
    for escalation in local.escalations : escalation.name => escalation
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
        type = recipient.value.type

        id = lookup(recipient.value, "id", null) != null ? recipient.value.id : (
          recipient.value.type == "team" ? opsgenie_team.this[recipient.value.team_name].id : (
            recipient.value.type == "user" ? try(opsgenie_user.this[recipient.value.user_name].id, data.opsgenie_user.this[recipient.value.user_name].id) : (
              null
            )
          )
        )
      }
    }
  }

  dynamic repeat {
    for_each = try(each.value.repeat, [])

    content {
      wait_interval          = repeat.value.wait_interval
      count                  = repeat.value.count
      reset_recipient_states = repeat.value.reset_recipient_states
      close_alert_after_all  = repeat.value.close_alert_after_all
    }
  }
}
