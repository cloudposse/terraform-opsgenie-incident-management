resource "opsgenie_team" "this" {
  for_each = {
    for team in local.teams : team.name => team
  }

  name                     = each.value.name
  description              = try(each.value.description, var.team.name)
  ignore_members           = try(each.value.ignore_members, false)
  delete_default_resources = try(each.value.delete_default_resources, false)
}
