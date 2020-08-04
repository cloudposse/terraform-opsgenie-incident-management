variable "team" {
  description = "This variable is used to configure Opsgenie Team."
  default     = {}
}

resource "opsgenie_team" "this" {
  name        = var.team.name
  description = try(var.team.description, var.team.name)
}
