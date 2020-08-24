resource "opsgenie_team" "this" {
  for_each = {
    for team in local.teams : team.name => team
  }

  name        = each.value.name
  description = each.value.description
}
