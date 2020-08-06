provider "opsgenie" {
  api_key = var.provider_api_key
  api_url = var.provider_api_url
}

resource "opsgenie_team" "this" {
  name        = var.team.name
  description = try(var.team.description, var.team.name)
}
