output "escalation_name" {
  description = "The Name of the Opsgenie escalation"
  value       = module.escalation.escalation_name
}

output "escalation_id" {
  description = "The ID of the Opsgenie escalation"
  value       = module.escalation.escalation_id
}

output "api_integration_id" {
  value = module.api_integration.api_integration_id
}

output "api_integration_name" {
  value = module.api_integration.api_integration_name
}

output "alert_policy_id" {
  value = module.alert_policy.alert_policy_id
}

output "alert_policy_name" {
  value = module.alert_policy.alert_policy_name
}

output "notification_policy_id" {
  value = module.notification_policy.notification_policy_id
}

output "notification_policy_name" {
  value = module.notification_policy.notification_policy_name
}

output "team_routing_rule_id" {
  value = module.team_routing_rule.team_routing_rule_id
}

output "team_routing_rule_name" {
  value = module.team_routing_rule.team_routing_rule_name
}

output "team_id" {
  value = module.team.team_id
}

output "team_name" {
  value = module.team.team_name
}

output "user_id" {
  value = module.user.user_id
}

output "service_id" {
  value = module.service.service_id
}
