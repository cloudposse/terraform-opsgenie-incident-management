provider "opsgenie" {
  api_key = var.opsgenie_provider_api_key
}

module "user" {
  source = "../../modules/user"

  user = {
    username  = format("opsgenie-test+%s@cloudposse.com", var.random_string)
    full_name = "Opsgenie Test User"
    role      = "User"
    locale    = "en_US"
    timezone  = "America/New_York"
  }

  context = module.this.context
}
