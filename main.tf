provider "opsgenie" {
  api_key = var.opsgenie_provider_api_key
}

module "alert_policy" {
  source = "./modules/alert_policy"

  alert_policy = var.alert_policy
  context      = module.this.context
}

module "api_integration" {
  source = "./modules/api_integration"

  api_integration = var.api_integration
  context         = module.this.context
}

module "escalation" {
  source = "./modules/escalation"

  escalation = var.escalation
  context    = module.this.context
}

module "integration_action" {
  source = "./modules/integration_action"

  integration_action = var.integration_action
  context            = module.this.context
}

module "notification_policy" {
  source = "./modules/notification_policy"

  notification_policy = var.notification_policy
  context             = module.this.context
}

module "team" {
  source = "./modules/team"

  team    = var.team
  context = module.this.context
}

module "team_routing_rule" {
  source = "./modules/team_routing_rule"

  team_routing_rule = var.team_routing_rule
  context           = module.this.context
}

module "user" {
  source = "./modules/user"

  user    = var.user
  context = module.this.context
}

module "service" {
  source = "./modules/service"

  service = var.service
  context = module.this.context
}

module "service_incident_rule" {
  source = "./modules/service_incident_rule"

  service_incident_rule = var.service_incident_rule
  context               = module.this.context
}
