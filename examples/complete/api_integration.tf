module "api_integration" {
  source = "../../modules/api_integration"

  opsgenie_provider_api_key = var.opsgenie_provider_api_key

  api_integration = {
    name          = module.label.id
    type          = "AmazonSns"
    owner_team_id = module.team.team_id
  }

}
