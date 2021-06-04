## Integration Action

Terraform module to configure [Opsgenie Integration Action](https://registry.terraform.io/providers/opsgenie/opsgenie/latest/docs/resources/integration_action)


## Usage

[Create Opsgenie Integration Action example](../../examples/integration_action)

```hcl
module "integration_action" {
  source  = "cloudposse/incident-management/opsgenie//modules/integration_action"
  # Cloud Posse recommends pinning every module to a specific version
  # version     = "x.x.x"

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
```

## Inputs

**Note:** `integration_action` is a map for two reasons: 
- to be able to put whole configuration in yaml file
- variables defined with type set are not robust enough (can't set default values)

|  Name                          |  Default                          |  Description                                                                                                                    | Required |
|:-------------------------------|:---------------------------------:|:--------------------------------------------------------------------------------------------------------------------------------|:--------:|
| `integration_action`          | `{}`                              | This variable is used to configure Opsgenie Integration Action.                                                                | Yes      |


## Outputs

| Name                        | Description                                  |
|:----------------------------|:---------------------------------------------|
| `integration_action_id`    | The ID of the Opsgenie Integration Action.  |
