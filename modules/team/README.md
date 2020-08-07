## Team

Terraform module to configure [Opsgenie Team](https://registry.terraform.io/providers/opsgenie/opsgenie/latest/docs/resources/team)


## Usage

[Create Opsgenie Team example](../../examples/team)

```hcl
module "team" {
  source = "git::https://github.com/cloudposse/terraform-opsgenie-incident-management.git//modules/team?ref=master"

  opsgenie_provider_api_key = var.opsgenie_provider_api_key

  team = {
    name        = module.label.id
    description = "team-description"
  }

}

```

## Inputs

**Note:** `team` is a map for two reasons: 
- to be able to put whole configuration in yaml file
- variables defined with type set are not robust enough (can't set default values)

|  Name                          |  Default                          |  Description                                                                                                                    | Required |
|:-------------------------------|:---------------------------------:|:--------------------------------------------------------------------------------------------------------------------------------|:--------:|
| `team`                         | `{}`                              | This variable is used to configure Opsgenie Team.                                                                               | Yes      |
| `opsgenie_provider_api_key`    | ``                                | The API Key for the Opsgenie Integration. If omitted, the OPSGENIE_API_KEY environment variable is used.                        | Yes      |
| `opsgenie_provider_api_url`    | `api.opsgenie.com`                | The API url for the Opsgenie.                                                                                                   | No       |


## Outputs

| Name                        | Description                              |
|:----------------------------|:-----------------------------------------|
| `team_name`                 | The name of the Opsgenie Team.           |
| `team_id`                   | The ID of the Opsgenie Team.             |
