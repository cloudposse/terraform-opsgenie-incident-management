output "alert_policies" {
  value = {
    for policy in opsgenie_alert_policy.this : policy.id => policy.name
  }
  description = "Alert policies"
}

output "api_integrations" {
  value = {
    for integration in opsgenie_api_integration.this : integration.id => integration.name
  }
  description = "API integrations"
}

output "api_integration_keys" {
  value = {
    for integration in opsgenie_api_integration.this : integration.name => integration.api_key
  }
  description = "A map of Opsgenie API integration names and generated API keys"
  sensitive   = true
}

output "escalations" {
  value = {
    for escalation in opsgenie_escalation.this : escalation.id => escalation.name
  }
  description = "Escalations"
}

output "notification_policies" {
  value = {
    for policy in opsgenie_notification_policy.this : policy.id => policy.name
  }
  description = "Notification policies"
}

output "team_routing_rules" {
  value = {
    for rule in opsgenie_team_routing_rule.this : rule.id => rule.name
  }
  description = "Team routing rules"
}

output "teams" {
  value = {
    for team in opsgenie_team.this : team.id => team.name
  }
  description = "Teams"
}

output "users" {
  value = [
    for user in opsgenie_user.this : user.id
  ]
  description = "User IDs"
}

output "services" {
  value = [
    for service in opsgenie_service.this : service.id
  ]
  description = "Service IDs"
}
