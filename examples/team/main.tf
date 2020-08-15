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
    name        = module.label.id
    description = "team-description"
  }

}
