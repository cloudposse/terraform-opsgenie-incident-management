resource "opsgenie_team" "this" {
  for_each = {
    for team in var.opsgenie_resources.teams : team.name => team
  }

  name        = each.value.name
  description = each.value.description
}
