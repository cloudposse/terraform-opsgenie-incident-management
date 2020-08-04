output "alert_policy" {
  description = "Opsgenie Alert Policy."
  value       = module.alert_policy
}

output "alert_policy_name" {
  description = "Name of the Opsgenie Alert Policy."
  value       = module.alert_policy.alert_policy_name
}

output "alert_policy_tags" {
  description = "Tags of the Opsgenie Alert Policy."
  value       = module.alert_policy.alert_policy_tags
}

output "alert_policy_filter" {
  description = "Filter of the Opsgenie Alert Policy."
  value       = module.alert_policy.alert_policy_filter
}

output "alert_policy_priority" {
  description = "Priority of the Opsgenie Alert Policy."
  value       = module.alert_policy.alert_policy_priority
}

output "alert_policy_responders" {
  description = "Responders of the Opsgenie Alert Policy."
  value       = module.alert_policy.alert_policy_responders
}
