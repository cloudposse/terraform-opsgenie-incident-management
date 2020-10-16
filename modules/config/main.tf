# Check if the configurations in the `opsgenie_resources` map are:
# 1. Defined (if not defined at all, `lookup` returns the default value of `[]`)
# 2. Not `null` (if it's defined, but empty, the value will be `null`, in which case `lookup` returns `null` and not the default value of `[]`)

locals {
  alert_policies         = lookup(var.opsgenie_resources, "alert_policies", []) != null ? lookup(var.opsgenie_resources, "alert_policies", []) : []
  api_integrations       = lookup(var.opsgenie_resources, "api_integrations", []) != null ? lookup(var.opsgenie_resources, "api_integrations", []) : []
  escalations            = lookup(var.opsgenie_resources, "escalations", []) != null ? lookup(var.opsgenie_resources, "escalations", []) : []
  notification_policies  = lookup(var.opsgenie_resources, "notification_policies", []) != null ? lookup(var.opsgenie_resources, "notification_policies", []) : []
  team_routing_rules     = lookup(var.opsgenie_resources, "team_routing_rules", []) != null ? lookup(var.opsgenie_resources, "team_routing_rules", []) : []
  teams                  = lookup(var.opsgenie_resources, "teams", []) != null ? lookup(var.opsgenie_resources, "teams", []) : []
  users                  = lookup(var.opsgenie_resources, "users", []) != null ? lookup(var.opsgenie_resources, "users", []) : []
  existing_users         = lookup(var.opsgenie_resources, "existing_users", []) != null ? lookup(var.opsgenie_resources, "existing_users", []) : []
  services               = lookup(var.opsgenie_resources, "services", []) != null ? lookup(var.opsgenie_resources, "services", []) : []
  service_incident_rules = lookup(var.opsgenie_resources, "service_incident_rules", []) != null ? lookup(var.opsgenie_resources, "service_incident_rules", []) : []
}
