output "escalation" {
  description = "Opsgenie Escalation"
  value       = module.escalation
}

output "escalation_name" {
  description = "The Name of the Opsgenie Escalation"
  value       = module.escalation.escalation_name
}

output "escalation_id" {
  description = "The ID of the Opsgenie Escalation"
  value       = module.escalation.escalation_id
}
