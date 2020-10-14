output "alert_policy_id" {
  description = "The ID of the Opsgenie Alert Policy"
  value       = module.alert_policy.alert_policy_id
}

output "alert_policy_name" {
  description = "Name of the Opsgenie Alert Policy"
  value       = module.alert_policy.alert_policy_name
}

output "alert_policy_filter" {
  description = "Filters of the Opsgenie Alert Policy"
  value       = module.alert_policy.alert_policy_filter
}

output "alert_policy_tags" {
  description = "Tags of the Opsgenie Alert Policy"
  value       = module.alert_policy.alert_policy_tags
}

output "alert_policy_priority" {
  description = "Priority of the Opsgenie Alert Policy"
  value       = module.alert_policy.alert_policy_priority
}

output "alert_policy_responders" {
  description = "Responders of the Opsgenie Alert Policy."
  value       = module.alert_policy.alert_policy_responders
}

output "api_integration_api_key" {
  description = "API key of the created integration"
  value       = module.api_integration.api_integration_api_key
  sensitive   = true
}

output "api_integration_name" {
  description = "The name of the Opsgenie API Integration"
  value       = module.api_integration.api_integration_name
}

output "api_integration_id" {
  description = "The ID of the Opsgenie API Integration"
  value       = module.api_integration.api_integration_id
}

output "escalation_id" {
  description = "The ID of the Opsgenie Escalation"
  value       = module.escalation.escalation_id
}

output "escalation_name" {
  description = "Name of the Opsgenie Escalation"
  value       = module.escalation.escalation_name
}

output "notification_policy_id" {
  description = "The ID of the Opsgenie Notification Policy"
  value       = module.notification_policy.notification_policy_id
}

output "notification_policy_name" {
  description = "The name of the Opsgenie Notification Policy"
  value       = module.notification_policy.notification_policy_name
}

output "team_id" {
  description = "The ID of the Opsgenie Team"
  value       = module.team.team_id
}

output "team_name" {
  description = "The name of the Opsgenie Team"
  value       = module.team.team_name
}

output "team_routing_rule_id" {
  description = "The ID of the Opsgenie Team Routing Rule"
  value       = module.team_routing_rule.team_routing_rule_id
}

output "team_routing_rule_name" {
  description = "The name of the Opsgenie Team Routing Rule"
  value       = module.team_routing_rule.team_routing_rule_name
}

output "user_id" {
  description = "The ID of the Opsgenie User"
  value       = module.user.user_id
}

output "service_id" {
  description = "The ID of the Opsgenie Service"
  value       = module.service.service_id
}
