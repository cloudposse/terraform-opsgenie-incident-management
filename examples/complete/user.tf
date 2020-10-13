module "user" {
  source = "../../modules/user"

  user = {
    username  = "test@example.com"
    full_name = "Test User"
    role      = "User"
    locale    = "en_US"
    timezone  = "America/New_York"
  }
}
