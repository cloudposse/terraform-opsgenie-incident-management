<!-- markdownlint-disable -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13.0 |
| <a name="requirement_opsgenie"></a> [opsgenie](#requirement\_opsgenie) | >= 0.4 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_alert_policy"></a> [alert\_policy](#module\_alert\_policy) | ./modules/alert_policy |  |
| <a name="module_api_integration"></a> [api\_integration](#module\_api\_integration) | ./modules/api_integration |  |
| <a name="module_escalation"></a> [escalation](#module\_escalation) | ./modules/escalation |  |
| <a name="module_notification_policy"></a> [notification\_policy](#module\_notification\_policy) | ./modules/notification_policy |  |
| <a name="module_service"></a> [service](#module\_service) | ./modules/service |  |
| <a name="module_service_incident_rule"></a> [service\_incident\_rule](#module\_service\_incident\_rule) | ./modules/service_incident_rule |  |
| <a name="module_team"></a> [team](#module\_team) | ./modules/team |  |
| <a name="module_team_routing_rule"></a> [team\_routing\_rule](#module\_team\_routing\_rule) | ./modules/team_routing_rule |  |
| <a name="module_this"></a> [this](#module\_this) | cloudposse/label/null | 0.24.1 |
| <a name="module_user"></a> [user](#module\_user) | ./modules/user |  |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_additional_tag_map"></a> [additional\_tag\_map](#input\_additional\_tag\_map) | Additional tags for appending to tags\_as\_list\_of\_maps. Not added to `tags`. | `map(string)` | `{}` | no |
| <a name="input_alert_policy"></a> [alert\_policy](#input\_alert\_policy) | Opsgenie Alert Policy configuration | `map` | `{}` | no |
| <a name="input_api_integration"></a> [api\_integration](#input\_api\_integration) | Opsgenie API Integration configuration | `map` | `{}` | no |
| <a name="input_attributes"></a> [attributes](#input\_attributes) | Additional attributes (e.g. `1`) | `list(string)` | `[]` | no |
| <a name="input_context"></a> [context](#input\_context) | Single object for setting entire context at once.<br>See description of individual variables for details.<br>Leave string and numeric variables as `null` to use default value.<br>Individual variable settings (non-null) override settings in context object,<br>except for attributes, tags, and additional\_tag\_map, which are merged. | `any` | <pre>{<br>  "additional_tag_map": {},<br>  "attributes": [],<br>  "delimiter": null,<br>  "enabled": true,<br>  "environment": null,<br>  "id_length_limit": null,<br>  "label_key_case": null,<br>  "label_order": [],<br>  "label_value_case": null,<br>  "name": null,<br>  "namespace": null,<br>  "regex_replace_chars": null,<br>  "stage": null,<br>  "tags": {}<br>}</pre> | no |
| <a name="input_delimiter"></a> [delimiter](#input\_delimiter) | Delimiter to be used between `namespace`, `environment`, `stage`, `name` and `attributes`.<br>Defaults to `-` (hyphen). Set to `""` to use no delimiter at all. | `string` | `null` | no |
| <a name="input_enabled"></a> [enabled](#input\_enabled) | Set to false to prevent the module from creating any resources | `bool` | `null` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Environment, e.g. 'uw2', 'us-west-2', OR 'prod', 'staging', 'dev', 'UAT' | `string` | `null` | no |
| <a name="input_escalation"></a> [escalation](#input\_escalation) | Opsgenie Escalation configuration | `map` | `{}` | no |
| <a name="input_id_length_limit"></a> [id\_length\_limit](#input\_id\_length\_limit) | Limit `id` to this many characters (minimum 6).<br>Set to `0` for unlimited length.<br>Set to `null` for default, which is `0`.<br>Does not affect `id_full`. | `number` | `null` | no |
| <a name="input_label_key_case"></a> [label\_key\_case](#input\_label\_key\_case) | The letter case of label keys (`tag` names) (i.e. `name`, `namespace`, `environment`, `stage`, `attributes`) to use in `tags`.<br>Possible values: `lower`, `title`, `upper`.<br>Default value: `title`. | `string` | `null` | no |
| <a name="input_label_order"></a> [label\_order](#input\_label\_order) | The naming order of the id output and Name tag.<br>Defaults to ["namespace", "environment", "stage", "name", "attributes"].<br>You can omit any of the 5 elements, but at least one must be present. | `list(string)` | `null` | no |
| <a name="input_label_value_case"></a> [label\_value\_case](#input\_label\_value\_case) | The letter case of output label values (also used in `tags` and `id`).<br>Possible values: `lower`, `title`, `upper` and `none` (no transformation).<br>Default value: `lower`. | `string` | `null` | no |
| <a name="input_name"></a> [name](#input\_name) | Solution name, e.g. 'app' or 'jenkins' | `string` | `null` | no |
| <a name="input_namespace"></a> [namespace](#input\_namespace) | Namespace, which could be your organization name or abbreviation, e.g. 'eg' or 'cp' | `string` | `null` | no |
| <a name="input_notification_policy"></a> [notification\_policy](#input\_notification\_policy) | Opsgenie Notification Policy configuration | `map` | `{}` | no |
| <a name="input_opsgenie_provider_api_key"></a> [opsgenie\_provider\_api\_key](#input\_opsgenie\_provider\_api\_key) | The API Key for the Opsgenie Integration. If omitted, the OPSGENIE\_API\_KEY environment variable is used | `string` | `""` | no |
| <a name="input_regex_replace_chars"></a> [regex\_replace\_chars](#input\_regex\_replace\_chars) | Regex to replace chars with empty string in `namespace`, `environment`, `stage` and `name`.<br>If not set, `"/[^a-zA-Z0-9-]/"` is used to remove all characters other than hyphens, letters and digits. | `string` | `null` | no |
| <a name="input_service"></a> [service](#input\_service) | Opsgenie Service configuration | `map` | `{}` | no |
| <a name="input_service_incident_rule"></a> [service\_incident\_rule](#input\_service\_incident\_rule) | Opsgenie Service Incident Rule configuration | `map` | `{}` | no |
| <a name="input_stage"></a> [stage](#input\_stage) | Stage, e.g. 'prod', 'staging', 'dev', OR 'source', 'build', 'test', 'deploy', 'release' | `string` | `null` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Additional tags (e.g. `map('BusinessUnit','XYZ')` | `map(string)` | `{}` | no |
| <a name="input_team"></a> [team](#input\_team) | Opsgenie Team configuration | `map` | `{}` | no |
| <a name="input_team_routing_rule"></a> [team\_routing\_rule](#input\_team\_routing\_rule) | Opsgenie Team Routing Rule configuration | `map` | `{}` | no |
| <a name="input_user"></a> [user](#input\_user) | Opsgenie User configuration | `map` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_alert_policy_filter"></a> [alert\_policy\_filter](#output\_alert\_policy\_filter) | Filters of the Opsgenie Alert Policy |
| <a name="output_alert_policy_id"></a> [alert\_policy\_id](#output\_alert\_policy\_id) | The ID of the Opsgenie Alert Policy |
| <a name="output_alert_policy_name"></a> [alert\_policy\_name](#output\_alert\_policy\_name) | Name of the Opsgenie Alert Policy |
| <a name="output_alert_policy_priority"></a> [alert\_policy\_priority](#output\_alert\_policy\_priority) | Priority of the Opsgenie Alert Policy |
| <a name="output_alert_policy_responders"></a> [alert\_policy\_responders](#output\_alert\_policy\_responders) | Responders of the Opsgenie Alert Policy. |
| <a name="output_alert_policy_tags"></a> [alert\_policy\_tags](#output\_alert\_policy\_tags) | Tags of the Opsgenie Alert Policy |
| <a name="output_api_integration_api_key"></a> [api\_integration\_api\_key](#output\_api\_integration\_api\_key) | API key of the created integration |
| <a name="output_api_integration_id"></a> [api\_integration\_id](#output\_api\_integration\_id) | The ID of the Opsgenie API Integration |
| <a name="output_api_integration_name"></a> [api\_integration\_name](#output\_api\_integration\_name) | The name of the Opsgenie API Integration |
| <a name="output_escalation_id"></a> [escalation\_id](#output\_escalation\_id) | The ID of the Opsgenie Escalation |
| <a name="output_escalation_name"></a> [escalation\_name](#output\_escalation\_name) | Name of the Opsgenie Escalation |
| <a name="output_notification_policy_id"></a> [notification\_policy\_id](#output\_notification\_policy\_id) | The ID of the Opsgenie Notification Policy |
| <a name="output_notification_policy_name"></a> [notification\_policy\_name](#output\_notification\_policy\_name) | The name of the Opsgenie Notification Policy |
| <a name="output_service_id"></a> [service\_id](#output\_service\_id) | The ID of the Opsgenie Service |
| <a name="output_service_incident_rule_id"></a> [service\_incident\_rule\_id](#output\_service\_incident\_rule\_id) | The ID of the Opsgenie Service Incident Rule |
| <a name="output_service_name"></a> [service\_name](#output\_service\_name) | The name of the Opsgenie Service |
| <a name="output_team_id"></a> [team\_id](#output\_team\_id) | The ID of the Opsgenie Team |
| <a name="output_team_name"></a> [team\_name](#output\_team\_name) | The name of the Opsgenie Team |
| <a name="output_team_routing_rule_id"></a> [team\_routing\_rule\_id](#output\_team\_routing\_rule\_id) | The ID of the Opsgenie Team Routing Rule |
| <a name="output_team_routing_rule_name"></a> [team\_routing\_rule\_name](#output\_team\_routing\_rule\_name) | The name of the Opsgenie Team Routing Rule |
| <a name="output_user_id"></a> [user\_id](#output\_user\_id) | The ID of the Opsgenie User |
| <a name="output_user_name"></a> [user\_name](#output\_user\_name) | The name of the Opsgenie User |
<!-- markdownlint-restore -->
