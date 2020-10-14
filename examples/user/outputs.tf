output "user" {
  description = "Opsgenie User"
  value       = module.user
}

output "user_id" {
  description = "The ID of the Opsgenie User"
  value       = module.user.user_id
}

output "user_name" {
  description = "The name of the Opsgenie User"
  value       = module.user.user_name
}
