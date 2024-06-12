resource "opsgenie_escalation" "this" {
  count = module.this.enabled ? 1 : 0

  name          = var.escalation.name
  description   = try(var.escalation.description, var.escalation.name)
  owner_team_id = try(var.escalation.owner_team_id, null)

  dynamic "rules" {
    for_each = try(var.escalation.rule, [])

    content {
      condition   = try(rules.value.condition, "if-not-acked")
      notify_type = try(rules.value.notify_type, "default")
      delay       = rules.value.delay

      recipient {
        type = rules.value.recipient.type
        id   = try(rules.value.recipient.id, null)
      }
    }
  }

  dynamic "repeat" {
    for_each = try(var.escalation.repeat, null) != null ? ["true"] : []

    content {
      wait_interval          = try(var.escalation.repeat.wait_interval, 5)
      count                  = try(var.escalation.repeat.count, 0)
      reset_recipient_states = try(var.escalation.repeat.reset_recipient_states, true)
      close_alert_after_all  = try(var.escalation.repeat.close_alert_after_all, true)
    }
  }
}
