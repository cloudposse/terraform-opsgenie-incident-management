module "user" {
  source = "../../modules/user"

  # Users can't be destroyed
  enabled = false

  user = {
    username  = format("opsgenie-test+%s-%s@cloudposse.com", module.this.attributes[0], module.this.name)
    full_name = "Opsgenie Test User"
    role      = "User"
    locale    = "en_US"
    timezone  = "America/New_York"
  }

  context = module.this.context
}
