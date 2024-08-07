variable "opsgenie_provider_api_key" {
  type        = string
  description = "The API Key for the Opsgenie Integration. If omitted, the OPSGENIE_API_KEY environment variable is used"
  default     = null
}

variable "random_string" {
  type        = string
  description = "A random string to append to the resource names"
  default     = null
}
