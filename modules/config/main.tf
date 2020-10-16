locals {
  alert_policies         = try(var.opsgenie_resources.alert_policies, null) != null ? var.opsgenie_resources.alert_policies : []
  api_integrations       = try(var.opsgenie_resources.api_integrations, null) != null ? var.opsgenie_resources.api_integrations : []
  escalations            = try(var.opsgenie_resources.escalations, null) != null ? var.opsgenie_resources.escalations : []
  notification_policies  = try(var.opsgenie_resources.notification_policies, null) != null ? var.opsgenie_resources.notification_policies : []
  team_routing_rules     = try(var.opsgenie_resources.team_routing_rules, null) != null ? var.opsgenie_resources.team_routing_rules : []
  teams                  = try(var.opsgenie_resources.teams, null) != null ? var.opsgenie_resources.teams : []
  users                  = try(var.opsgenie_resources.users, null) != null ? var.opsgenie_resources.users : []
  existing_users         = try(var.opsgenie_resources.existing_users, null) != null ? var.opsgenie_resources.existing_users : []
  services               = try(var.opsgenie_resources.services, null) != null ? var.opsgenie_resources.services : []
  service_incident_rules = try(var.opsgenie_resources.service_incident_rules, null) != null ? var.opsgenie_resources.service_incident_rules : []
}
