provider "opsgenie" {
  api_key = var.provider_api_key
  api_url = var.provider_api_url
}

resource "opsgenie_api_integration" "this" {
  name = var.api_integration.name
  type = var.api_integration.type

  dynamic responders {
    for_each = try(var.api_integration.responders, [])

    content {
      type = responders.value.type
      id   = responders.value.id
    }
  }

  enabled                        = try(var.api_integration.enabled, true)
  allow_write_access             = try(var.api_integration.allow_write_access, true)
  ignore_responders_from_payload = try(var.api_integration.ignore_responders_from_payload, false)
  suppress_notifications         = try(var.api_integration.suppress_notifications, false)

  owner_team_id = try(var.api_integration.owner_team_id, null)
}

