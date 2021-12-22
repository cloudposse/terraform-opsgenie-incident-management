resource "opsgenie_schedule" "default" {
  count = module.this.enabled ? 1 : 0

  name          = var.schedule.name
  description   = try(var.schedule.description, var.schedule.name)
  owner_team_id = try(var.schedule.owner_team_id, null)

  enabled  = try(var.schedule.enabled, true)
  timezone = try(var.schedule.timezone, null)
}
