module "user" {
  source = "../../modules/user"

  user = {
    username  = "opsgenie_test@cloudposse.com"
    full_name = "Opsgenie Test User"
    role      = "User"
    locale    = "en_US"
    timezone  = "America/New_York"
  }
}
