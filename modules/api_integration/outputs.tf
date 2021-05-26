output "api_integration_api_key" {
  description = "API key of the created integration"
  value       = try(opsgenie_api_integration.this[0].api_key, null)
  sensitive   = true
}

output "api_integration_name" {
  description = "The name of the Opsgenie API Integration"
  value       = try(opsgenie_api_integration.this[0].name, null)
}

output "api_integration_id" {
  description = "The ID of the Opsgenie API Integration"
  value       = try(opsgenie_api_integration.this[0].id, null)
}
