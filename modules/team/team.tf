variable "team" {
  description = "This variable is used to configure opsgenie team."
  default     = {}
}

resource "opsgenie_team" "this" {
  name        = var.team.name
  description = try(var.team.description, var.team.name)
}
