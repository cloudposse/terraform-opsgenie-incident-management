resource "opsgenie_service" "this" {
  for_each = module.this.enabled ? { for service in local.services : service.name => service } : tomap()

  name        = each.value.name
  team_id     = try(opsgenie_team.this[each.value.team_name].id, data.opsgenie_team.this[each.value.team_name].id)
  description = try(each.value.description, null)
}
