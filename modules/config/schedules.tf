resource "opsgenie_schedule" "this" {
  for_each = module.this.enabled ? { for schedule in local.schedules : schedule.name => schedule } : tomap()

  enabled = try(each.value.enabled, true)

  name        = each.value.name
  description = try(each.value.description, each.value.name)
  timezone    = try(each.value.timezone, each.value.name)

  # Look up our team id by name
  owner_team_id = try(opsgenie_team.this[each.value.owner_team_name].id, null)
}
