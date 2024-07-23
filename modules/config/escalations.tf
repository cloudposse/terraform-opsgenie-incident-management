resource "opsgenie_escalation" "this" {
  for_each = module.this.enabled ? { for escalation in local.escalations : format("%s.%s", escalation.owner_team_name, escalation.name) => escalation } : tomap()

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

      dynamic "recipient" {
        for_each = try(rules.value.recipients, [])

        content {
          type = recipient.value.type

          id = lookup(recipient.value, "id", null) != null ? recipient.value.id : (
            recipient.value.type == "team" ? opsgenie_team.this[recipient.value.team_name].id : (
              recipient.value.type == "user" ? try(opsgenie_user.this[recipient.value.user_name].id, data.opsgenie_user.this[recipient.value.user_name].id) : (
                recipient.value.type == "schedule" ? opsgenie_schedule.this[recipient.value.schedule_name].id : (
                  null
                )
              )
            )
          )
        }
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
