resource "opsgenie_user" "this" {
  username  = var.user.username
  full_name = var.user.full_name
  role      = var.user.role
  locale    = try(var.user.locale, "en_US")
  timezone  = try(var.user.timezone, "America/New_York")
}
