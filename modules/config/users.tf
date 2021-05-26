resource "opsgenie_user" "this" {
  for_each = module.this.enabled ? { for user in local.users : user.username => user } : {}

  username  = each.value.username
  full_name = each.value.full_name
  role      = each.value.role
  locale    = try(each.value.locale, "en_US")
  timezone  = try(each.value.timezone, "America/New_York")
}
