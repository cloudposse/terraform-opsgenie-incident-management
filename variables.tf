variable "opsgenie_provider_api_key" {
  type        = string
  description = "The API Key for the Opsgenie Integration. If omitted, the OPSGENIE_API_KEY environment variable is used"
  default     = ""
}

variable "alert_policy" {
  default     = {}
  description = "Opsgenie Alert Policy configuration"
}

variable "api_integration" {
  default     = {}
  description = "Opsgenie API Integration configuration"
}

variable "escalation" {
  default     = {}
  description = "Opsgenie Escalation configuration"
}

variable "integration_action" {
  default     = {}
  description = "Opsgenie Integration Action configuration"
}

variable "notification_policy" {
  default     = {}
  description = "Opsgenie Notification Policy configuration"
}

variable "team" {
  default     = {}
  description = "Opsgenie Team configuration"
}

variable "team_routing_rule" {
  default     = {}
  description = "Opsgenie Team Routing Rule configuration"
}

variable "user" {
  default     = {}
  description = "Opsgenie User configuration"
}

variable "service" {
  default     = {}
  description = "Opsgenie Service configuration"
}

variable "service_incident_rule" {
  default     = {}
  description = "Opsgenie Service Incident Rule configuration"
}
