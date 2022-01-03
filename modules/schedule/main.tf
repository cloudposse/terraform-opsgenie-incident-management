resource "opsgenie_schedule" "default" {
  count = module.this.enabled ? 1 : 0

  name          = var.schedule.name
  description   = try(var.schedule.description, null)
  owner_team_id = try(var.schedule.owner_team_id, null)

  enabled  = try(var.schedule.enabled, null) # this is the state of the schedule, NOT module.this.enabled
  timezone = try(var.schedule.timezone, null)
}
