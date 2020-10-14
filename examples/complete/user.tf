module "user" {
  source = "../../modules/user"

  # Users can't be destroyed
  enabled = false

  user = {
    username  = "opsgenie-test@cloudposse.com"
    full_name = "Opsgenie Test User"
    role      = "User"
    locale    = "en_US"
    timezone  = "America/New_York"
  }
}
