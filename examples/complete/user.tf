module "user" {
  source = "../../modules/user"

  user = {
    username  = "opsgenie-test-2@cloudposse.com"
    full_name = "Opsgenie Test User"
    role      = "User"
    locale    = "en_US"
    timezone  = "America/New_York"
  }
}
