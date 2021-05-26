# https://docs.opsgenie.com/docs/alert-api

resource "opsgenie_alert_policy" "this" {
  for_each = module.this.enabled ? {for policy in local.alert_policies : policy.name => policy} : {}

  name               = each.value.name
  policy_description = try(each.value.description, each.value.name)

  # Look up our team id by name
  team_id = try(opsgenie_team.this[each.value.owner_team_name].id, null)

  enabled         = try(each.value.enabled, true)
  continue_policy = try(each.value.continue, true)

  alias    = try(each.value.alias, null)
  entity   = try(each.value.entity, null)
  message  = try(each.value.message, "{{message}}")
  priority = try(each.value.priority, null)
  source   = try(each.value.source, null)
  tags     = try(each.value.tags, null)

  ignore_original_actions    = try(each.value.ignore_original_actions, false)
  ignore_original_details    = try(each.value.ignore_original_details, false)
  ignore_original_responders = try(each.value.ignore_original_responders, false)
  ignore_original_tags       = try(each.value.ignore_original_tags, false)

  dynamic "responders" {
    for_each = try(each.value.responders, [])

    content {
      type = responders.value.type

      id = lookup(responders.value, "id", null) != null ? responders.value.id : (
        responders.value.type == "team" ? opsgenie_team.this[responders.value.team_name].id : (
          responders.value.type == "user" ? try(opsgenie_user.this[responders.value.user_name].id, data.opsgenie_user.this[responders.value.user_name].id) : (
            responders.value.type == "escalation" ? opsgenie_escalation.this[responders.value.escalation_name].id : (
              null
            )
          )
        )
      )

      name     = try(responders.value.name, null)
      username = try(responders.value.username, null)
    }
  }

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
      }
    }
  }
}
