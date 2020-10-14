resource "opsgenie_team" "this" {
  for_each = {
    for team in local.teams : team.name => team
  }

  name                     = each.value.name
  description              = try(each.value.description, each.value.name)
  ignore_members           = try(each.value.ignore_members, false)
  delete_default_resources = try(each.value.delete_default_resources, false)

  dynamic member {
    for_each = try(each.value.members, [])

    content {
      id   = opsgenie_user.this[member.value.username].id
      role = member.value.role
    }
  }
}
