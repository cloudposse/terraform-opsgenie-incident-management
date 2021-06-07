output "integration_action_id" {
  description = "The ID of the Opsgenie Integration Action"
  value       = try(opsgenie_integration_action.this[0].id, null)
}
