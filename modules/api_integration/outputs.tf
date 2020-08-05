output "api_integration_api_key" {
  description = "API key of the created integration"
  value       = opsgenie_api_integration.this.api_key
  sensitive   = true
}

output "api_integration_name" {
  description = "The name of the Opsgenie API Integration."
  value       = opsgenie_api_integration.this.name
}

output "api_integration_id" {
  description = "The ID of the Opsgenie API Integration."
  value       = opsgenie_api_integration.this.id
}
