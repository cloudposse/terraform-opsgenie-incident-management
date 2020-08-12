terraform {
  required_version = "~> 0.12"

  required_providers {
    opsgenie = {
      version = "~> 0.4"
      source = "terraform-providers/opsgenie"
  }
}
