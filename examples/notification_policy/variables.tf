variable "opsgenie_provider_api_key" {
  type        = string
  description = "The API Key for the Opsgenie Integration. If omitted, the OPSGENIE_API_KEY environment variable is used"
  default     = null
}

variable "de_duplication_action" {
  type        = object({
    de_duplication_action_type = string
    count                      = number
    duration                   = object({
      time_unit   = string
      time_amount = number
    })
  })
  description = "The de-duplication action for the notification policy"
  default = null
}

variable "delay_action" {
  type        = object({
    delay_option = string
    duration      = object({
      time_unit   = string
      time_amount = number
    })
  })
  description = "The delay action for the notification policy"
  default = null
}
