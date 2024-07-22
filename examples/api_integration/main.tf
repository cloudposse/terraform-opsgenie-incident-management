provider "opsgenie" {
  api_key = var.opsgenie_provider_api_key
}

module "team" {
  source = "../../modules/team"

  team = {
    name = module.this.id
  }

  context = module.this.context
}

module "api_integration" {
  source = "../../modules/api_integration"

  api_integration = {
    name          = module.this.id
    type          = "AmazonSns"
    owner_team_id = module.team.team_id
  }

  context = module.this.context
}
