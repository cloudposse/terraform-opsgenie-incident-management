## Alert Policy

Terraform module to configure [Opsgenie Alert Policy](https://registry.terraform.io/providers/opsgenie/opsgenie/latest/docs/resources/alert_policy)


## Usage

[Create Opsgenie Alert Policy example](../../examples/alert_policy)

```hcl
module "alert_policy" {
  source = "git::https://github.com/cloudposse/terraform-opsgenie-incident-management.git//modules/alert_policy?ref=master"

  opsgenie_provider_api_key = var.opsgenie_provider_api_key

  alert_policy = {
    name = "alert-policy"

    tags     = ["test1", "test2"]
    priority = "P1"

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
    }
  }
}
```

## Inputs

**Note:** `alert_policy` is a map for two reasons: 
- to be able to put whole configuration in yaml file
- variables defined with type set are not robust enough (can't set default values)

|  Name                          |  Default                          |  Description                                                                                                                    | Required |
|:-------------------------------|:---------------------------------:|:--------------------------------------------------------------------------------------------------------------------------------|:--------:|
| `alert_policy`                 | `{}`                              | This variable is used to configure Opsgenie Alert Policy.                                                                       | Yes      |
| `opsgenie_provider_api_key`    | ``                                | The API Key for the Opsgenie Integration. If omitted, the OPSGENIE_API_KEY environment variable is used.                        | Yes      |
| `opsgenie_provider_api_url`    | `api.opsgenie.com`                | The API url for the Opsgenie.                                                                                                   | No       |


## Outputs

| Name                        | Description                             |
|:----------------------------|:----------------------------------------|
| `alert_policy_id`           | The ID of the Opsgenie Alert Policy.    |
| `alert_policy_name`         | Name of the Opsgenie Alert Policy.      |
| `alert_policy_filter`       | Filters of the Opsgenie Alert Policy.   |
| `alert_policy_tags`         | Tags of the Opsgenie Alert Policy.      |
| `alert_policy_priority`     | Priority of the Opsgenie Alert Policy.  |
| `alert_policy_responders`   | Responders of the Opsgenie Alert Policy.|
