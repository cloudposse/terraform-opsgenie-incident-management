module "label" {
  source = "git::https://github.com/cloudposse/terraform-null-label.git?ref=tags/0.16.0"

  attributes = var.attributes
  delimiter  = var.delimiter
  name       = var.name
  namespace  = var.namespace
  stage      = var.stage
  tags       = var.tags
}

module "team" {
  source = "../../modules/team"

  opsgenie_provider_api_key = var.opsgenie_provider_api_key

  team = {
    name        = module.label.id
    description = "team-description"
  }

}
