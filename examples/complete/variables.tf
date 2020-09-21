variable "opsgenie_provider_api_key" {
  type        = string
  description = "The API Key for the Opsgenie Integration. If omitted, the OPSGENIE_API_KEY environment variable is used"
  default     = null
}

variable "opsgenie_team" {
  description = "This variable is used to configure opsgenie team"
  default     = {}
}

variable "ignore_members" {
  type        = bool
  description = "Set to true to ignore any configured member blocks and any team member added/updated/removed via OpsGenie web UI"
  default     = false
}
