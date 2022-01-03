output "team" {
  description = "Opsgenie Team"
  value       = module.team
}

output "team_id" {
  description = "The ID of the Opsgenie Team"
  value       = module.team.team_id
}

output "team_name" {
  description = "The name of the Opsgenie Team"
  value       = module.team.team_name
}
