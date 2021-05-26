output "service_incident_rule_id" {
  description = "The ID of the Opsgenie Service Incident Rule"
  value       = try(opsgenie_service_incident_rule.this[0].id, null)
}
