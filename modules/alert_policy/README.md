## Alert Policy

Terraform module to configure [Opsgenie Alert Policy](https://registry.terraform.io/providers/opsgenie/opsgenie/latest/docs/resources/alert_policy)


## Usage

Create Opsgenie Alert Policy

```hcl
module "alert_policy" {
  source = "git::https://github.com/cloudposse/terraform-opsgenie-incident-management.git//modules/alert_policy?ref=master"

  provider_api_key = var.opsgenie_provider_api_key

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

|  Name                          |  Default                          |  Description                                                                                                                    | Required |
|:-------------------------------|:---------------------------------:|:--------------------------------------------------------------------------------------------------------------------------------|:--------:|


## Outputs

| Name                        | Description                             |
|:----------------------------|:----------------------------------------|
