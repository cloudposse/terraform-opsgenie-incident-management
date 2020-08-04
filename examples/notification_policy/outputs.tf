output "notification_policy_id" {
  description = "The ID of the Opsgenie Notification Policy."
  value       = module.notification_policy.notification_policy_id
}

output "notification_policy_name" {
  description = "The name of the Opsgenie Notification Policy."
  value       = module.notification_policy.notification_policy_name
}
