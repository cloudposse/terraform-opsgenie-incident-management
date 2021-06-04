module "integration_action" {
  source = "../../modules/integration_action"

  integration_action = {
    integration_id = module.api_integration.api_integration_id

    close = [
      {
        name = "Close low priority alerts"
        filter = {
          type = "match-any-condition"
          conditions = [
            {
              field          = "priority"
              operation      = "equals"
              expected_value = "P5"
            },
            {
              field          = "message"
              operation      = "contains"
              expected_value = "DEBUG"
            }
          ]
        }
      }
    ]
  }
}
