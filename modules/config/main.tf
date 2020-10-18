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
}
