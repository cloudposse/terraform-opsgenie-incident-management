resource "opsgenie_alert_policy" "this" {
  for_each = {
    for policy in var.opsgenie_resources.alert_policies : policy.name => policy
  }

  name               = each.value.name
  policy_description = try(each.value.description, each.value.name)

  # Look up our team id by name
  team_id = try(opsgenie_team.this[each.value.owner_team_name].id, null)

  enabled         = try(each.value.enabled, true)
  continue_policy = try(each.value.continue, true)

  alias    = try(each.value.alias, null)
  entity   = try(each.value.entity, null)
  message  = try(each.value.message, "{{ message }}")
  priority = try(each.value.priority, null)
  source   = try(each.value.source, null)
  tags     = try(each.value.tags, null)

  ignore_original_actions    = try(each.value.ignore_original_actions, false)
  ignore_original_details    = try(each.value.ignore_original_details, false)
  ignore_original_responders = try(each.value.ignore_original_responders, false)
  ignore_original_tags       = try(each.value.ignore_original_tags, false)

  dynamic responders {
    for_each = try(each.value.responders, [])

    content {
      id       = try(responders.value.id, null)
      name     = try(responders.value.name, null)
      type     = responders.value.type
      username = try(responders.value.username, null)
    }
  }

  filter {
    type = try(each.value.filter.type, "match-all")

    dynamic conditions {
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
