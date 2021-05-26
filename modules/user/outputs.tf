output "user_id" {
  description = "The ID of the Opsgenie User"
  value       = try(opsgenie_user.this[0].id, null)
}

output "user_name" {
  description = "The username of the Opsgenie User"
  value       = try(opsgenie_user.this[0].username, null)
}
