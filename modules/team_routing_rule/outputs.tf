output "team_routing_rule_id" {
  description = "The ID of the Opsgenie Team Routing Rule"
  value       = opsgenie_team_routing_rule.this.id
}

output "team_routing_rule_name" {
  description = "The name of the Opsgenie Team Routing Rule"
  value       = opsgenie_team_routing_rule.this.name
}
