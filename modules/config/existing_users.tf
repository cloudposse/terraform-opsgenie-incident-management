// local.existing users is a list of key pairs, in which all keys are "username".
// I want to remove duplicated items from the list based on the value of each item.
locals {
  distinct_existing_users = distinct([for user in local.existing_users : user.username])
  unique_existing_users = [for u in local.distinct_existing_users : {"username" = u}]
}

data "opsgenie_user" "this" {
  for_each = module.this.enabled ? { for user in local.unique_existing_users : user.username => user } : tomap()

  username = each.value.username
}
