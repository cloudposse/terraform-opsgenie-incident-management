output "integration_action" {
  description = "Opsgenie Integration Action"
  value       = module.integration_action
}

output "integration_action_id" {
  description = "The ID of the Opsgenie Integration Action"
  value       = module.integration_action.integration_action_id
}
