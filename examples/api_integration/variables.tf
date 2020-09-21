variable "opsgenie_provider_api_key" {
  type        = string
  description = "The API Key for the Opsgenie Integration. If omitted, the OPSGENIE_API_KEY environment variable is used"
  default     = null
}

variable "opsgenie_integration" {
  description = "This variable is used to configure opsgenie integration"
  default     = {}
}
