## Service

Terraform module to configure [Opsgenie Service](https://registry.terraform.io/providers/opsgenie/opsgenie/latest/docs/resources/service)


## Usage

[Create Opsgenie Service example](../../examples/service)

```hcl
module "service" {
  source = "git::https://github.com/cloudposse/terraform-opsgenie-incident-management.git//modules/service?ref=master"

  service = {
      name        = "frontend"
      team_id     = "..."
      description = "My company frontend service"
  }
}
```

## Inputs

**Note:** `service` is a map for two reasons: 
- to be able to put whole configuration in yaml file
- variables defined with type set are not robust enough (can't set default values)

|  Name                          |  Default                          |  Description                                                                                                                    | Required |
|:-------------------------------|:---------------------------------:|:--------------------------------------------------------------------------------------------------------------------------------|:--------:|
| `service`                      | `{}`                              | Opsgenie Service configuration                                                                              | Yes      |


## Outputs

| Name                        | Description                              |
|:----------------------------|:-----------------------------------------|
| `service_id`                | The ID of the Opsgenie Service              |
