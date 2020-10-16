resource "opsgenie_api_integration" "this" {
  for_each = {
    for integration in local.api_integrations : integration.name => integration
  }

  name = each.value.name
  type = each.value.type

  dynamic responders {
    for_each = try(each.value.responders, [])

    content {
      type = responders.value.type
      id   = responders.value.id
    }
  }

  enabled                        = try(each.value.enabled, true)
  allow_write_access             = try(each.value.allow_write_access, true)
  ignore_responders_from_payload = try(each.value.ignore_responders_from_payload, false)
  suppress_notifications         = try(each.value.suppress_notifications, false)

  # Look up our team id by name
  owner_team_id = opsgenie_team.this[each.value.owner_team_name].id
}
