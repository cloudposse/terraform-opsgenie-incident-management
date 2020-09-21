output "alert_policy_id" {
  description = "The ID of the Opsgenie Alert Policy"
  value       = opsgenie_alert_policy.this.id
}

output "alert_policy_name" {
  description = "Name of the Opsgenie Alert Policy"
  value       = opsgenie_alert_policy.this.name
}

output "alert_policy_filter" {
  description = "Filters of the Opsgenie Alert Policy"
  value       = opsgenie_alert_policy.this.filter
}

output "alert_policy_tags" {
  description = "Tags of the Opsgenie Alert Policy"
  value       = opsgenie_alert_policy.this.tags
}

output "alert_policy_priority" {
  description = "Priority of the Opsgenie Alert Policy"
  value       = opsgenie_alert_policy.this.priority
}

output "alert_policy_responders" {
  description = "Responders of the Opsgenie Alert Policy"
  value       = opsgenie_alert_policy.this.responders
}
