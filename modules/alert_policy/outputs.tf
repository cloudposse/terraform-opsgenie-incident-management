output "alert_policy_id" {
  description = "The ID of the Opsgenie Alert Policy"
  value       = try(opsgenie_alert_policy.this[0].id, null)
}

output "alert_policy_name" {
  description = "Name of the Opsgenie Alert Policy"
  value       = try(opsgenie_alert_policy.this[0].name, null)
}

output "alert_policy_filter" {
  description = "Filters of the Opsgenie Alert Policy"
  value       = try(opsgenie_alert_policy.this[0].filter, null)
}

output "alert_policy_tags" {
  description = "Tags of the Opsgenie Alert Policy"
  value       = try(opsgenie_alert_policy.this[0].tags, null)
}

output "alert_policy_priority" {
  description = "Priority of the Opsgenie Alert Policy"
  value       = try(opsgenie_alert_policy.this[0].priority, null)
}

output "alert_policy_responders" {
  description = "Responders of the Opsgenie Alert Policy"
  value       = try(opsgenie_alert_policy.this[0].responders, null)
}

output "alert_policy_time_restrictions" {
  description = "Time restrictions of the Opsgenie Alert Policy"
  value       = try(opsgenie_alert_policy.this[0].time_restriction, null)
}