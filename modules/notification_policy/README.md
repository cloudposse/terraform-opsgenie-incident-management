## Notification Policy

Terraform module to configure [Opsgenie Notification Policy](https://registry.terraform.io/providers/opsgenie/opsgenie/latest/docs/resources/notification_policy)


## Usage

[Create Opsgenie Notification Policy example](../../examples/notification_policy)

```hcl
module "notification_policy" {
  source  = "cloudposse/incident-management/opsgenie//modules/notification_policy"
  # Cloud Posse recommends pinning every module to a specific version
  # version     = "x.x.x"

  notification_policy = {
    name    = module.label.id
    team_id = module.team.team_id

    filter = {
      type = "match-all-conditions"
      conditions = [{
        field          = "tags"
        operation      = "contains"
        expected_value = "recommendation:auto-close"
      }]
    }

    auto_close_action = {
      time_unit   = "minutes"
      time_amount = 5
    }
  }
}
```

## Inputs

**Note:** `notification_policy` is a map for two reasons: 
- to be able to put whole configuration in yaml file
- variables defined with type set are not robust enough (can't set default values)

|  Name                          |  Default                          |  Description                                                                                                                    | Required |
|:-------------------------------|:---------------------------------:|:--------------------------------------------------------------------------------------------------------------------------------|:--------:|
| `notification_policy`          | `{}`                              | This variable is used to configure Opsgenie Notification Policy.                                                                | Yes      |


## Outputs

| Name                        | Description                                  |
|:----------------------------|:---------------------------------------------|
| `notification_policy_name`  | The name of the Opsgenie Notification Policy.|
| `notification_policy_id`    | The ID of the Opsgenie Notification Policy.  |
