variable "team_routing_rule" {
  description = "This variable is used to configure Opsgenie Team Routing Rule."
  default     = {}
}

resource "opsgenie_team_routing_rule" "this" {
  name     = var.team_routing_rule.name
  team_id  = var.team_routing_rule.team_id
  order    = try(var.team_routing_rule.order, 0)
  timezone = try(var.team_routing_rule.timezone, "America/Los_Angeles")

  criteria {
    type = try(var.team_routing_rule.criteria.type, "match-all")

    dynamic conditions {
      for_each = try(var.team_routing_rule.criteria.conditions, [])

      content {
        field          = try(conditions.value["field"], null)
        operation      = try(conditions.value["operation"], null)
        expected_value = try(conditions.value["expected_value"], null)
        key            = try(conditions.value["key"], null)
        not            = try(conditions.value["not"], null)
      }
    }
  }

  dynamic notify {
    for_each = try(var.team_routing_rule.notify, [])

    content {
      # name and id parameters are mutually exclusive
      id   = try(notify.value.id, null)
      name = try(notify.value.name, null)
      type = notify.value.type
    }
  }
}
