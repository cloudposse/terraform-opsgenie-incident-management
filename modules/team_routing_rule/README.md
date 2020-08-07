##  Team Routing Rule

Terraform module to configure [Opsgenie Team Routing Rule](https://registry.terraform.io/providers/opsgenie/opsgenie/latest/docs/resources/team_routing_rule)


## Usage

[Create Opsgenie Team Routing Rule example](../../examples/team_routing_rule)

```hcl
module "team_routing_rule" {
  source = "git::https://github.com/cloudposse/terraform-opsgenie-incident-management.git//modules/team_routing_rule?ref=master"

  opsgenie_provider_api_key = var.opsgenie_provider_api_key

  team_routing_rule = {
    name    = module.label.id
    team_id = module.owner_team.team_id

    notify = [{
      type = "escalation"
      id   = module.escalation.escalation_id
    }]
  }

}
```

## Inputs

**Note:** `team_routing_rule` is a map for two reasons: 
- to be able to put whole configuration in yaml file
- variables defined with type set are not robust enough (can't set default values)

|  Name                          |  Default                          |  Description                                                                                                                    | Required |
|:-------------------------------|:---------------------------------:|:--------------------------------------------------------------------------------------------------------------------------------|:--------:|
| `team_routing_rule`            | `{}`                              | This variable is used to configure Opsgenie Team Routing Rule.                                                                  | Yes      |
| `opsgenie_provider_api_key`    | ``                                | The API Key for the Opsgenie Integration. If omitted, the OPSGENIE_API_KEY environment variable is used.                        | Yes      |
| `opsgenie_provider_api_url`    | `api.opsgenie.com`                | The API url for the Opsgenie.                                                                                                   | No       |


## Outputs

| Name                        | Description                                 |
|:----------------------------|:--------------------------------------------|
| `team_routing_rule_name`    | The name of the Opsgenie Team Routing Rule.|
| `team_routing_rule_id`      | The ID of the Opsgenie Team Routing Rule.  |
