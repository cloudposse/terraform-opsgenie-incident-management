## Requirements

| Name | Version |
|------|---------|
| terraform | ~> 0.13 |
| opsgenie/opsgenie | ~> 0.4 |

## Providers

No provider.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| alert\_policy | This variable is used to configure Opsgenie Alert Policy. | `map` | `{}` | no |
| api\_integration | This variable is used to configure Opsgenie API Integration. | `map` | `{}` | no |
| attributes | Additional attributes (\_e.g.\_ "1") | `list(string)` | `[]` | no |
| delimiter | Delimiter between `namespace`, `stage`, `name` and `attributes` | `string` | `"-"` | no |
| enabled | Set to false to prevent the module from creating any resources | `bool` | `true` | no |
| escalation | This variable is used to configure Opsgenie Escalation. | `map` | `{}` | no |
| name | Name of the application | `string` | `""` | no |
| namespace | Namespace (e.g. `eg` or `cp`) | `string` | `""` | no |
| notification\_policy | This variable is used to configure Opsgenie Notification Policy. | `map` | `{}` | no |
| opsgenie\_provider\_api\_key | The API Key for the Opsgenie Integration. If omitted, the OPSGENIE\_API\_KEY environment variable is used. | `string` | `""` | no |
| stage | Stage (e.g. `prod`, `dev`, `staging`) | `string` | `""` | no |
| tags | Additional tags (\_e.g.\_ { BusinessUnit : ABC }) | `map(string)` | `{}` | no |
| team | This variable is used to configure Opsgenie Team. | `map` | `{}` | no |
| team\_routing\_rule | This variable is used to configure Opsgenie Team Routing Rule. | `map` | `{}` | no |

## Outputs

No output.

