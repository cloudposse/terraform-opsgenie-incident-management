## Escalation

Terraform module to configure [Opsgenie Escalation](https://registry.terraform.io/providers/opsgenie/opsgenie/latest/docs/resources/escalation)


## Usage

[Create Opsgenie Escalation example](../../examples/escalation)

```hcl
module "escalation" {
  source = "git::https://github.com/cloudposse/terraform-opsgenie-incident-management.git//modules/escalation?ref=master"

  opsgenie_provider_api_key = var.opsgenie_provider_api_key

  escalation = {
    name          = module.label.id
    owner_team_id = module.owner_team.team_id

    rule = {
      recipients = [{
        type = "team"
        id   = module.escalation_team.team_id
      }]
    }
  }

}

```

## Inputs

**Note:** `escalation` is a map for two reasons: 
- to be able to put whole configuration in yaml file
- variables defined with type set are not robust enough (can't set default values)

|  Name                          |  Default                          |  Description                                                                                                                    | Required |
|:-------------------------------|:---------------------------------:|:--------------------------------------------------------------------------------------------------------------------------------|:--------:|
| `escalation`                   | `{}`                              | This variable is used to configure Opsgenie Escalation.                                                                         | Yes      |
| `opsgenie_provider_api_key`    | ``                                | The API Key for the Opsgenie Integration. If omitted, the OPSGENIE_API_KEY environment variable is used.                        | Yes      |
| `opsgenie_provider_api_url`    | `api.opsgenie.com`                | The API url for the Opsgenie.                                                                                                   | No       |


## Outputs

| Name                        | Description                              |
|:----------------------------|:-----------------------------------------|
| `escalation_name`      | The name of the Opsgenie Escalation.|
| `escalation_id`        | The ID of the Opsgenie Escalation.  |
