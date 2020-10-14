resource "opsgenie_service" "this" {
  name        = var.service.name
  team_id     = var.service.team_id
  description = var.service.description
}
