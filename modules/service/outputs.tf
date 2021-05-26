output "service_id" {
  description = "The ID of the Opsgenie Service"
  value       = try(opsgenie_service.this[0].id, null)
}

output "service_name" {
  description = "The name of the Opsgenie Service"
  value       = try(opsgenie_service.this[0].name, null)
}
