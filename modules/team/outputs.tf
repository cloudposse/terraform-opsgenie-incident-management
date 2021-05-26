output "team_id" {
  description = "The ID of the Opsgenie Team"
  value       = try(opsgenie_team.this[0].id, null)
}

output "team_name" {
  description = "The name of the Opsgenie Team"
  value       = try(opsgenie_team.this[0].name, null)
}
