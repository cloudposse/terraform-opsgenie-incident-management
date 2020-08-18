module "api_integration" {
  source = "../../modules/api_integration"

  api_integration = {
    name          = module.label.id
    type          = "AmazonSns"
    owner_team_id = module.team.team_id
  }

}
