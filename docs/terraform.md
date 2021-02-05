<!-- markdownlint-disable -->
## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.13.0 |
| opsgenie | >= 0.4 |

## Providers

No provider.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| additional\_tag\_map | Additional tags for appending to tags\_as\_list\_of\_maps. Not added to `tags`. | `map(string)` | `{}` | no |
| alert\_policy | Opsgenie Alert Policy configuration | `map` | `{}` | no |
| api\_integration | Opsgenie API Integration configuration | `map` | `{}` | no |
| attributes | Additional attributes (e.g. `1`) | `list(string)` | `[]` | no |
| context | Single object for setting entire context at once.<br>See description of individual variables for details.<br>Leave string and numeric variables as `null` to use default value.<br>Individual variable settings (non-null) override settings in context object,<br>except for attributes, tags, and additional\_tag\_map, which are merged. | `any` | <pre>{<br>  "additional_tag_map": {},<br>  "attributes": [],<br>  "delimiter": null,<br>  "enabled": true,<br>  "environment": null,<br>  "id_length_limit": null,<br>  "label_key_case": null,<br>  "label_order": [],<br>  "label_value_case": null,<br>  "name": null,<br>  "namespace": null,<br>  "regex_replace_chars": null,<br>  "stage": null,<br>  "tags": {}<br>}</pre> | no |
| delimiter | Delimiter to be used between `namespace`, `environment`, `stage`, `name` and `attributes`.<br>Defaults to `-` (hyphen). Set to `""` to use no delimiter at all. | `string` | `null` | no |
| enabled | Set to false to prevent the module from creating any resources | `bool` | `null` | no |
| environment | Environment, e.g. 'uw2', 'us-west-2', OR 'prod', 'staging', 'dev', 'UAT' | `string` | `null` | no |
| escalation | Opsgenie Escalation configuration | `map` | `{}` | no |
| id\_length\_limit | Limit `id` to this many characters (minimum 6).<br>Set to `0` for unlimited length.<br>Set to `null` for default, which is `0`.<br>Does not affect `id_full`. | `number` | `null` | no |
| label\_key\_case | The letter case of label keys (`tag` names) (i.e. `name`, `namespace`, `environment`, `stage`, `attributes`) to use in `tags`.<br>Possible values: `lower`, `title`, `upper`.<br>Default value: `title`. | `string` | `null` | no |
| label\_order | The naming order of the id output and Name tag.<br>Defaults to ["namespace", "environment", "stage", "name", "attributes"].<br>You can omit any of the 5 elements, but at least one must be present. | `list(string)` | `null` | no |
| label\_value\_case | The letter case of output label values (also used in `tags` and `id`).<br>Possible values: `lower`, `title`, `upper` and `none` (no transformation).<br>Default value: `lower`. | `string` | `null` | no |
| name | Solution name, e.g. 'app' or 'jenkins' | `string` | `null` | no |
| namespace | Namespace, which could be your organization name or abbreviation, e.g. 'eg' or 'cp' | `string` | `null` | no |
| notification\_policy | Opsgenie Notification Policy configuration | `map` | `{}` | no |
| opsgenie\_provider\_api\_key | The API Key for the Opsgenie Integration. If omitted, the OPSGENIE\_API\_KEY environment variable is used | `string` | `""` | no |
| regex\_replace\_chars | Regex to replace chars with empty string in `namespace`, `environment`, `stage` and `name`.<br>If not set, `"/[^a-zA-Z0-9-]/"` is used to remove all characters other than hyphens, letters and digits. | `string` | `null` | no |
| service | Opsgenie Service configuration | `map` | `{}` | no |
| service\_incident\_rule | Opsgenie Service Incident Rule configuration | `map` | `{}` | no |
| stage | Stage, e.g. 'prod', 'staging', 'dev', OR 'source', 'build', 'test', 'deploy', 'release' | `string` | `null` | no |
| tags | Additional tags (e.g. `map('BusinessUnit','XYZ')` | `map(string)` | `{}` | no |
| team | Opsgenie Team configuration | `map` | `{}` | no |
| team\_routing\_rule | Opsgenie Team Routing Rule configuration | `map` | `{}` | no |
| user | Opsgenie User configuration | `map` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| alert\_policy\_filter | Filters of the Opsgenie Alert Policy |
| alert\_policy\_id | The ID of the Opsgenie Alert Policy |
| alert\_policy\_name | Name of the Opsgenie Alert Policy |
| alert\_policy\_priority | Priority of the Opsgenie Alert Policy |
| alert\_policy\_responders | Responders of the Opsgenie Alert Policy. |
| alert\_policy\_tags | Tags of the Opsgenie Alert Policy |
| api\_integration\_api\_key | API key of the created integration |
| api\_integration\_id | The ID of the Opsgenie API Integration |
| api\_integration\_name | The name of the Opsgenie API Integration |
| escalation\_id | The ID of the Opsgenie Escalation |
| escalation\_name | Name of the Opsgenie Escalation |
| notification\_policy\_id | The ID of the Opsgenie Notification Policy |
| notification\_policy\_name | The name of the Opsgenie Notification Policy |
| service\_id | The ID of the Opsgenie Service |
| service\_incident\_rule\_id | The ID of the Opsgenie Service Incident Rule |
| service\_name | The name of the Opsgenie Service |
| team\_id | The ID of the Opsgenie Team |
| team\_name | The name of the Opsgenie Team |
| team\_routing\_rule\_id | The ID of the Opsgenie Team Routing Rule |
| team\_routing\_rule\_name | The name of the Opsgenie Team Routing Rule |
| user\_id | The ID of the Opsgenie User |
| user\_name | The name of the Opsgenie User |

<!-- markdownlint-restore -->
