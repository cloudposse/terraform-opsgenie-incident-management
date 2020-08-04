output "escalation_name" {
  description = "The Name of the Opsgenie escalation."
  value       = module.escalation.escalation_name
}

output "escalation_id" {
  description = "The ID of the Opsgenie escalation."
  value       = module.escalation.escalation_id
}
