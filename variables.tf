variable "enabled" {
  type        = bool
  description = "Set to false to prevent the module from creating any resources"
  default     = true
}

variable "namespace" {
  type        = string
  description = "Namespace (e.g. `eg` or `cp`)"
  default     = ""
}

variable "stage" {
  type        = string
  description = "Stage (e.g. `prod`, `dev`, `staging`)"
  default     = ""
}

variable "name" {
  type        = string
  description = "Name of the application"
  default     = ""
}

variable "delimiter" {
  type        = string
  default     = "-"
  description = "Delimiter between `namespace`, `stage`, `name` and `attributes`"
}

variable "attributes" {
  type        = list(string)
  description = "Additional attributes (_e.g._ \"1\")"
  default     = []
}

variable "tags" {
  type        = map(string)
  description = "Additional tags (_e.g._ { BusinessUnit : ABC })"
  default     = {}
}

variable "opsgenie_provider_api_key" {
  type        = string
  description = "The API Key for the Opsgenie Integration. If omitted, the OPSGENIE_API_KEY environment variable is used."
  default     = ""
}

variable "alert_policy" {
  default     = {}
  description = "This variable is used to configure Opsgenie Alert Policy."
}

variable "api_integration" {
  default     = {}
  description = "This variable is used to configure Opsgenie API Integration."
}

variable "escalation" {
  default     = {}
  description = "This variable is used to configure Opsgenie Escalation."
}

variable "notification_policy" {
  default     = {}
  description = "This variable is used to configure Opsgenie Notification Policy."
}

variable "team" {
  default     = {}
  description = "This variable is used to configure Opsgenie Team."
}

variable "team_routing_rule" {
  default     = {}
  description = "This variable is used to configure Opsgenie Team Routing Rule."
}
