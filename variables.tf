variable "opsgenie_provider_api_key" {
  type        = string
  description = "The API Key for the Opsgenie Integration. If omitted, the OPSGENIE_API_KEY environment variable is used"
  default     = ""
}

variable "alert_policy" {
  default     = {}
  description = "This variable is used to configure Opsgenie Alert Policy"
}

variable "api_integration" {
  default     = {}
  description = "This variable is used to configure Opsgenie API Integration"
}

variable "escalation" {
  default     = {}
  description = "This variable is used to configure Opsgenie Escalation"
}

variable "notification_policy" {
  default     = {}
  description = "This variable is used to configure Opsgenie Notification Policy"
}

variable "team" {
  default     = {}
  description = "This variable is used to configure Opsgenie Team"
}

variable "team_routing_rule" {
  default     = {}
  description = "This variable is used to configure Opsgenie Team Routing Rule"
}
