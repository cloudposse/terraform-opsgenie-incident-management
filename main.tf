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

module "alert_policy" {
  source = "./modules/alert_policy"

  alert_policy = var.alert_policy
}

module "api_integration" {
  source = "./modules/api_integration"

  api_integration = var.api_integration
}

module "escalation" {
  source = "./modules/escalation"

  escalation = var.escalation
}

module "notification_policy" {
  source = "./modules/notification_policy"

  notification_policy = var.notification_policy
}

module "team" {
  source = "./modules/team"

  team = var.team
}

module "team_routing_rule" {
  source = "./modules/team_routing_rule"

  team_routing_rule = var.team_routing_rule
}
