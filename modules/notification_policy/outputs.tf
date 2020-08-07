output "notification_policy_id" {
  description = "The ID of the Opsgenie Notification Policy."
  value       = opsgenie_notification_policy.this.id
}

output "notification_policy_name" {
  description = "The name of the Opsgenie Notification Policy."
  value       = opsgenie_notification_policy.this.name
}
