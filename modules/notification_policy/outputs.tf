output "notification_policy_id" {
  description = "The ID of the Opsgenie Notification Policy"
  value       = try(opsgenie_notification_policy.this[0].id, null)
}

output "notification_policy_name" {
  description = "The name of the Opsgenie Notification Policy"
  value       = try(opsgenie_notification_policy.this[0].name, null)
}
