output "team_id" {
  description = "The ID of the Opsgenie Team"
  value       = opsgenie_team.this.id
}

output "team_name" {
  description = "The name of the Opsgenie Team"
  value       = opsgenie_team.this.name
}
