resource "opsgenie_service" "this" {
  for_each = local.services != null ? { for service in local.services : service.name => service } : {}

  name        = each.value.name
  team_id     = opsgenie_team.this[each.value.team_name].id
  description = try(each.value.description, null)
}
