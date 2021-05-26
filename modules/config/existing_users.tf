data "opsgenie_user" "this" {
  for_each = module.this.enabled ? {for user in local.existing_users : user.username => user} : {}

  username = each.value.username
}
