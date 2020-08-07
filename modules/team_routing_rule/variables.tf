variable "opsgenie_provider_api_key" {
  type        = string
  description = "The API Key for the Opsgenie Integration. If omitted, the OPSGENIE_API_KEY environment variable is used."
  default     = ""
}

variable "provider_api_url" {
  type        = string
  description = "The API url for the Opsgenie."
  default     = "api.opsgenie.com"
}

variable "team_routing_rule" {
  default     = {}
  description = "This variable is used to configure Opsgenie Team Routing Rule."
}
