output "service_incident_rule_id" {
  description = "The ID of the Opsgenie Service Incident Rule"
  value       = opsgenie_service_incident_rule.this.id
}
