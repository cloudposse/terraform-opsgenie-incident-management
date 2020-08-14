variable "ignore_members" {
  type        = bool
  description = "Set to true to ignore any configured member blocks and any team member added/updated/removed via OpsGenie web UI"
  default     = false
}

variable "opsgenie_provider_api_key" {
  type        = string
  description = "The API Key for the Opsgenie Integration. If omitted, the OPSGENIE_API_KEY environment variable is used."
  default     = ""
}

variable "opsgenie_provider_api_url" {
  type        = string
  description = "The API url for the Opsgenie."
  default     = "api.opsgenie.com"
}

variable "team" {
  default     = {}
  description = "This variable is used to configure Opsgenie Team."
}
