output "team_routing_rule" {
  description = "Opsgenie Team Routing Rule"
  value       = module.team_routing_rule
}

output "team_routing_rule_id" {
  description = "The ID of the Opsgenie Team Routing Rule"
  value       = module.team_routing_rule.team_routing_rule_id
}

output "team_routing_rule_name" {
  description = "The name of the Opsgenie Team Routing Rule"
  value       = module.team_routing_rule.team_routing_rule_name
}
