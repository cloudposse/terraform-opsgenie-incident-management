module "label" {
  source = "git::https://github.com/cloudposse/terraform-null-label.git?ref=tags/0.16.0"

  attributes = var.attributes
  delimiter  = var.delimiter
  name       = var.name
  namespace  = var.namespace
  stage      = var.stage
  tags       = var.tags
}

module "alert_policy" {
  source = "../../modules/alert_policy"

  provider_api_key = var.opsgenie_provider_api_key

  alert_policy = {
    name = module.label.id
    filter = {
      type = "match-all-conditions"
      conditions = [
        {
          field          = "source"
          operation      = "matches"
          expected_value = ".*prod.*"
        },
        {
          field          = "tags"
          operation      = "contains"
          expected_value = "severity:critical"
        }
      ]
      priority = "P1"
    }
  }


}
