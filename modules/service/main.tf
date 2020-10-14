resource "opsgenie_service" "this" {
  count = module.this.enabled ? 1 : 0

  name        = var.service.name
  team_id     = var.service.team_id
  description = var.service.description
}
