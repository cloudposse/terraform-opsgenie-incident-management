output "service_id" {
  description = "The ID of the Opsgenie Service"
  value       = opsgenie_service.this.id
}

output "service_name" {
  description = "The name of the Opsgenie Service"
  value       = opsgenie_service.this.name
}
