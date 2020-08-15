provider "opsgenie" {
  api_key = var.opsgenie_provider_api_key
}

module "label" {
  source = "git::https://github.com/cloudposse/terraform-null-label.git?ref=tags/0.17.0"

  attributes = var.attributes
  delimiter  = var.delimiter
  name       = var.name
  namespace  = var.namespace
  stage      = var.stage
  tags       = var.tags
}

module "team" {
  source = "../../modules/team"

  team = {
    name = module.label.id
  }
}

module "api_integration" {
  source = "../../modules/api_integration"

  api_integration = {
    name          = module.label.id
    type          = "AmazonSns"
    owner_team_id = module.team.team_id
  }

}
