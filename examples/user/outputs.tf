output "user" {
  description = "Opsgenie User"
  value       = module.user
}

output "team_id" {
  description = "The ID of the Opsgenie User"
  value       = module.user.user_id
}
