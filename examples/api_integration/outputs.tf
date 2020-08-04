output "api_integration_name" {
  description = "The name of the Opsgenie API Integration"
  value       = module.api_integration.api_integration_name
}

output "api_integration_id" {
  description = "The ID of the Opsgenie API Integration"
  value       = module.api_integration.api_integration_id
}

output "api_integration_api_key" {
  description = "The API key of the Opsgenie API Integration"
  value       = module.api_integration.api_integration_api_key
  sensitive = true
}
