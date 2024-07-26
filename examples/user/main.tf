provider "opsgenie" {
  api_key = var.opsgenie_provider_api_key
}

module "user" {
  source = "../../modules/user"

  user = {
    // opsgenie-test+tofu-user@cloudposse.com
    // opsgenie-test+tf-user@cloudposse.com
    username  = format("opsgenie-test+%s-%s@cloudposse.com", module.this.attributes[0], module.this.name)
    full_name = "Opsgenie Test User"
    role      = "User"
    locale    = "en_US"
    timezone  = "America/New_York"
  }

  context = module.this.context
}
