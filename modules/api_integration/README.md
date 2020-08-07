## API Integration

Terraform module to configure [Opsgenie API Integration](https://registry.terraform.io/providers/opsgenie/opsgenie/latest/docs/resources/api_integration)


## Usage

[Create Opsgenie API Integration example](../../examples/alert_policy)

```hcl
module "api_integration" {
  source = "git::https://github.com/cloudposse/terraform-opsgenie-incident-management.git//modules/api_integration?ref=master"

  opsgenie_provider_api_key = var.opsgenie_provider_api_key

  api_integration = {
    name          = module.label.id
    type          = "AmazonSns"
    owner_team_id = module.team.team_id
  }
}
```

## Inputs

**Note:** `api_integration` is a map for two reasons: 
- to be able to put whole configuration in yaml file
- variables defined with type set are not robust enough (can't set default values)

|  Name                          |  Default                          |  Description                                                                                                                    | Required |
|:-------------------------------|:---------------------------------:|:--------------------------------------------------------------------------------------------------------------------------------|:--------:|
| `api_integration`              | `{}`                              | This variable is used to configure Opsgenie API Integration.                                                                    | Yes      |
| `opsgenie_provider_api_key`    | ``                                | The API Key for the Opsgenie Integration. If omitted, the OPSGENIE_API_KEY environment variable is used.                        | Yes      |
| `opsgenie_provider_api_url`    | `api.opsgenie.com`                | The API url for the Opsgenie.                                                                                                   | No       |


## Outputs

| Name                        | Description                              |
|:----------------------------|:-----------------------------------------|
| `api_integration_api_key`   | API key of the created integration       |
| `api_integration_name`      | The name of the Opsgenie API Integration.|
| `api_integration_id`        | The ID of the Opsgenie API Integration.  |
