resource "opsgenie_escalation" "this" {
  name          = var.escalation.name
  description   = try(var.escalation.description, var.escalation.name)
  owner_team_id = try(var.escalation.owner_team_id, null)

  rules {
    condition   = try(var.escalation.rule.condition, "if-not-acked")
    notify_type = try(var.escalation.rule.notify_type, "default")
    delay       = try(var.escalation.rule.delay, 0)

    dynamic recipient {
      for_each = try(var.escalation.rule.recipients, [])

      content {
        id   = recipient.value.id
        type = recipient.value.type
      }
    }
  }

  dynamic repeat {
    for_each = try(var.escalation.repeat, {})

    content {
      wait_interval          = repeat.wait_interval
      count                  = repeat.count
      reset_recipient_states = repeat.reset_recipient_states
      close_alert_after_all  = repeat.close_alert_after_all
    }
  }
}
