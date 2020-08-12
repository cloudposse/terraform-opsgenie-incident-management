terraform {
  required_version = "~> 0.13"

  required_providers {
    opsgenie = {
      source  = "terraform-providers/opsgenie"
      version = "~> 0.4"
    }
  }
}
