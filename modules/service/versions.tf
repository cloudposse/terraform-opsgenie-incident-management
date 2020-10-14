terraform {
  required_version = ">= 0.12.26"

  required_providers {
    opsgenie = {
      source  = "opsgenie/opsgenie"
      version = ">= 0.4"
    }
  }
}
