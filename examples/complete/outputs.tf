output "escalation_id" {
  description = "The ID of the Opsgenie escalation"
  value       = module.escalation.escalation_id
}

output "escalation_name" {
  description = "The name of the Opsgenie escalation"
  value       = module.escalation.escalation_name
}

output "integration_action_id" {
  description = "The ID of the Opsgenie Integration Action"
  value       = module.integration_action.integration_action_id
}

output "api_integration_id" {
  description = "The ID of the Opsgenie integration"
  value       = module.api_integration.api_integration_id
}

output "api_integration_name" {
  description = "The name of the Opsgenie integration"
  value       = module.api_integration.api_integration_name
}

output "alert_policy_id" {
  description = "The ID of the Opsgenie policy"
  value       = module.alert_policy.alert_policy_id
}

output "alert_policy_name" {
  description = "The name of the Opsgenie policy"
  value       = module.alert_policy.alert_policy_name
}

output "notification_policy_id" {
  description = "The ID of the Opsgenie notification policy"
  value       = module.notification_policy.notification_policy_id
}

output "notification_policy_name" {
  description = "The name of the Opsgenie notification policy"
  value       = module.notification_policy.notification_policy_name
}

output "team_routing_rule_id" {
  description = "The ID of the Opsgenie team routing rule"
  value       = module.team_routing_rule.team_routing_rule_id
}

output "team_routing_rule_name" {
  description = "The name of the Opsgenie team routing rule"
  value       = module.team_routing_rule.team_routing_rule_name
}

output "team_id" {
  description = "The ID of the Opsgenie team"
  value       = module.team.team_id
}

output "team_name" {
  description = "The name of the Opsgenie team"
  value       = module.team.team_name
}

output "user_id" {
  description = "The ID of the Opsgenie user"
  value       = module.user.user_id
}

output "user_name" {
  description = "The name of the Opsgenie user"
  value       = module.user.user_name
}

output "service_id" {
  description = "The ID of the Opsgenie service"
  value       = module.service.service_id
}

output "service_name" {
  description = "The name of the Opsgenie service"
  value       = module.service.service_name
}

output "service_incident_rule_id" {
  description = "The ID of the Opsgenie service incident rule"
  value       = module.service_incident_rule.service_incident_rule_id
}
