// local.existing users is a list of key pairs, in which all keys are "username".
// Let's remove duplicated items from the list based on the value of each item.
// Existing schedules and teams are just a plain list of their respective
// resource names.
locals {
  distinct_existing_users = distinct([for user in local.existing_users : user.username])
  unique_existing_users   = [for u in local.distinct_existing_users : { "username" = u }]

  unique_existing_schedules = distinct(local.existing_schedules)

  unique_existing_teams = distinct(local.existing_teams)
}

data "opsgenie_user" "this" {
  for_each = module.this.enabled ? { for user in local.unique_existing_users : user.username => user } : tomap()

  username = each.value.username
}

data "opsgenie_schedule" "this" {
  for_each = module.this.enabled ? toset(local.unique_existing_schedules) : toset()

  name = each.key
}

data "opsgenie_team" "this" {
  for_each = module.this.enabled ? toset(local.unique_existing_teams) : toset()

  name = each.key
}
