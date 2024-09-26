variable "team" {
  description = "Opsgenie Team configuration"
  
  type = object({
    name                     = string
    description              = optional(string, "")  # Optional, default: name
    ignore_members           = optional(bool, false)  # Optional, default: false
    delete_default_resources = optional(bool, false)  # Optional, default: false
    members                  = optional(list(object({
      id   = string  # UUID of the member (required)
      role = optional(string, "user")  # Optional, default: "user"
    })), [])  # Default: empty list
  })

  default = {
    name                     = ""  # Name must be defined
    description              = ""
    ignore_members           = false
    delete_default_resources = false
    members                  = []  # Default: empty list
  }
}
