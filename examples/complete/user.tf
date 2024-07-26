module "user" {
  source = "../../modules/user"

  user = {
    username  = format("opsgenie-test+%s-%s@cloudposse.com", try(module.this.attributes[0], "none"), module.this.name)
    full_name = "Opsgenie Test User"
    role      = "User"
    locale    = "en_US"
    timezone  = "America/New_York"
  }

  context = module.this.context
}
