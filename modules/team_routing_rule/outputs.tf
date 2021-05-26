output "team_routing_rule_id" {
  description = "The ID of the Opsgenie Team Routing Rule"
  value       = try(opsgenie_team_routing_rule.this[0].id, null)
}

output "team_routing_rule_name" {
  description = "The name of the Opsgenie Team Routing Rule"
  value       = try(opsgenie_team_routing_rule.this[0].name, null)
}
