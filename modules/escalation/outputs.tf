output "escalation_id" {
  description = "The ID of the Opsgenie Escalation"
  value       = opsgenie_escalation.this.id
}

output "escalation_name" {
  description = "Name of the Opsgenie Escalation"
  value       = opsgenie_escalation.this.name
}
