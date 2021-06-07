output "integration_action_id" {
  description = "The ID of the Opsgenie Integration Action"
  value       = module.integration_action.integration_action_id
}

output "api_integration_id" {
  description = "The ID of the Opsgenie integration"
  value       = module.api_integration.api_integration_id
}

output "api_integration_name" {
  description = "The name of the Opsgenie integration"
  value       = module.api_integration.api_integration_name
}

output "team_id" {
  description = "The ID of the Opsgenie team"
  value       = module.team.team_id
}

output "team_name" {
  description = "The name of the Opsgenie team"
  value       = module.team.team_name
}
