resource "opsgenie_team" "this" {
  name                     = var.team.name
  description              = try(var.team.description, var.team.name)
  ignore_members           = try(var.team.ignore_members, false)
  delete_default_resources = try(var.team.delete_default_resources, false)

  dynamic member {
    for_each = try(var.team.members, [])

    content {
      id   = member.id
      role = member.role
    }
  }
}
