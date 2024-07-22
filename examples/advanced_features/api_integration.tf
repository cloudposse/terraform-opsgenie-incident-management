module "api_integration" {
  source = "../../modules/api_integration"

  api_integration = {
    name          = module.this.id
    type          = "AmazonSns"
    owner_team_id = module.team.team_id
  }

  context = module.this.context
}
