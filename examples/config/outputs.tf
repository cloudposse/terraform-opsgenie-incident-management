output "api_integrations" {
  value       = module.opsgenie_config.api_integrations
  description = "API integrations"
}

output "alert_policies" {
  value       = module.opsgenie_config.alert_policies
  description = "Alert policies"
}

output "escalations" {
  value       = module.opsgenie_config.escalations
  description = "Escalations"
}

output "integration_actions" {
  value       = module.opsgenie_config.integration_actions
  description = "Integration Actions"
}

output "notification_policies" {
  value       = module.opsgenie_config.notification_policies
  description = "Notification policies"
}

output "team_routing_rules" {
  value       = module.opsgenie_config.team_routing_rules
  description = "Team routing rules"
}

output "teams" {
  value       = module.opsgenie_config.teams
  description = "Teams"
}

output "users" {
  value       = module.opsgenie_config.users
  description = "Users"
}

output "services" {
  value       = module.opsgenie_config.services
  description = "Services"
}

output "service_incident_rule_ids" {
  value       = module.opsgenie_config.service_incident_rule_ids
  description = "Service Incident Rule IDs"
}
