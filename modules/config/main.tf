locals {
  alert_policies         = lookup(var.opsgenie_resources, "alert_policies", [])
  api_integrations       = lookup(var.opsgenie_resources, "api_integrations", [])
  escalations            = lookup(var.opsgenie_resources, "escalations", [])
  notification_policies  = lookup(var.opsgenie_resources, "notification_policies", [])
  team_routing_rules     = lookup(var.opsgenie_resources, "team_routing_rules", [])
  teams                  = lookup(var.opsgenie_resources, "teams", [])
  users                  = lookup(var.opsgenie_resources, "users", [])
  existing_users         = lookup(var.opsgenie_resources, "existing_users", [])
  services               = lookup(var.opsgenie_resources, "services", [])
  service_incident_rules = lookup(var.opsgenie_resources, "service_incident_rules", [])

  //  alert_policies         = try(var.opsgenie_resources.alert_policies, [])
  //  api_integrations       = try(var.opsgenie_resources.api_integrations, [])
  //  escalations            = try(var.opsgenie_resources.escalations, [])
  //  notification_policies  = try(var.opsgenie_resources.notification_policies, [])
  //  team_routing_rules     = try(var.opsgenie_resources.team_routing_rules, [])
  //  teams                  = try(var.opsgenie_resources.teams, [])
  //  users                  = try(var.opsgenie_resources.users, [])
  //  existing_users         = try(var.opsgenie_resources.existing_users, [])
  //  services               = try(var.opsgenie_resources.services, [])
  //  service_incident_rules = try(var.opsgenie_resources.service_incident_rules, [])

}
