output "api_integration_api_key" {
  value       = opsgenie_api_integration.this.api_key
  description = "API key of the created integration"
  sensitive   = true
}

output "api_integration_name" {
  value       = opsgenie_api_integration.this.name
  description = "The name of the Opsgenie API Integration."
}

output "api_integration_id" {
  value       = opsgenie_api_integration.this.id
  description = "The ID of the Opsgenie API Integration."
}
