variable "opsgenie_provider_api_key" {
  type        = string
  description = "The API Key for the Opsgenie Integration. If omitted, the OPSGENIE_API_KEY environment variable is used"
  default     = null
}

variable "opsgenie_alert_policy" {
  description = "This variable is used to configure opsgenie alert policy"
  default     = {}
}
