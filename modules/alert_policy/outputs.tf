output "alert_policy_id" {
  description = "The ID of the Opsgenie Alert Policy."
  value       = opsgenie_alert_policy.this.id
}

output "alert_policy_name" {
  description = "Name of the Opsgenie Alert Policy."
  value       = opsgenie_alert_policy.this.name
}
