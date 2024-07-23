resource "opsgenie_escalation" "this" {
  for_each = module.this.enabled ? { for escalation in local.escalations : escalation.name => escalation } : tomap()

  name        = each.value.name
  description = try(each.value.description, each.value.name)

  # Look up our team id by name
  owner_team_id = try(opsgenie_team.this[each.value.owner_team_name].id, null)

  dynamic "rules" {
    for_each = try(each.value.rules, [])

    content {
      condition   = try(rules.value.condition, "if-not-acked")
      notify_type = try(rules.value.notify_type, "default")
      delay       = try(rules.value.delay, 0)

      recipient {
        type = rules.value.recipient.type

        id = try(rules.value.recipient.id, null) != null ? rules.value.recipient.id : (
          rules.value.recipient.type == "team" ? try(opsgenie_team.this[rules.value.recipient.team_name].id, data.opsgenie_team.this[rules.value.recipient.team_name].id) : (
            rules.value.recipient.type == "user" ? try(opsgenie_user.this[rules.value.recipient.user_name].id, data.opsgenie_user.this[rules.value.recipient.user_name].id) : (
              rules.value.recipient.type == "schedule" ? try(opsgenie_schedule.this[rules.value.recipient.schedule_name].id, data.opsgenie_schedule.this[rules.value.recipient.schedule_name].id) : (
                null
              )
            )
          )
        )
      }
    }
  }

  dynamic "repeat" {
    for_each = try(each.value.repeat, {})

    content {
      wait_interval          = lookup(each.value.repeat, "wait_interval", 5)
      count                  = lookup(each.value.repeat, "count", 0)
      reset_recipient_states = lookup(each.value.repeat, "reset_recipient_states", true)
      close_alert_after_all  = lookup(each.value.repeat, "close_alert_after_all", true)
    }
  }
}
