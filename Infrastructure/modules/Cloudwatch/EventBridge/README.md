<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 2.70.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 2.70.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_cloudwatch_event_api_destination.api_dest](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_event_api_destination) | resource |
| [aws_cloudwatch_event_bus.event_bridge_bus](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_event_bus) | resource |
| [aws_cloudwatch_event_bus_policy.event_bus_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_event_bus_policy) | resource |
| [aws_cloudwatch_event_connection.eventBridge_connection](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_event_connection) | resource |
| [aws_cloudwatch_event_rule.event_bridge](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_event_rule) | resource |
| [aws_cloudwatch_event_target.eventBridge_target](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_event_target) | resource |
| [aws_iam_role.eventBridge_rule_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.eventBridge_Lambda_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.eventBridge_kinesis_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.eventBridge_s3_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.eventBridge_sns_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_policy_document.event_bus_policy_doc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.event_rule_role_doc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_eventBridge_api_destination_description"></a> [eventBridge\_api\_destination\_description](#input\_eventBridge\_api\_destination\_description) | Specifies the description of the eventBridge api destination | `string` | `null` | no |
| <a name="input_eventBridge_api_destination_name"></a> [eventBridge\_api\_destination\_name](#input\_eventBridge\_api\_destination\_name) | Specifies the name of the eventBridge api destination | `string` | `null` | no |
| <a name="input_eventBridge_api_http_method"></a> [eventBridge\_api\_http\_method](#input\_eventBridge\_api\_http\_method) | Select the HTTP method used for the invocation endpoint, such as GET, POST, PUT, etc. | `string` | `null` | no |
| <a name="input_eventBridge_api_invocation_endpoint"></a> [eventBridge\_api\_invocation\_endpoint](#input\_eventBridge\_api\_invocation\_endpoint) | URL endpoint to invoke as a target. This could be a valid endpoint generated by a partner service. You can include  '*' as path parameters wildcards to be set from the Target HttpParameters. | `string` | `null` | no |
| <a name="input_eventBridge_api_invocation_rate_limit_per_second"></a> [eventBridge\_api\_invocation\_rate\_limit\_per\_second](#input\_eventBridge\_api\_invocation\_rate\_limit\_per\_second) | Enter the maximum number of invocations per second to allow for this destination. Enter a value greater than 0 (default 300). | `number` | `null` | no |
| <a name="input_eventBridge_bus_name"></a> [eventBridge\_bus\_name](#input\_eventBridge\_bus\_name) | Specifies the name of the eventBridge bus | `string` | n/a | yes |
| <a name="input_eventBridge_connection_auth_basic_password"></a> [eventBridge\_connection\_auth\_basic\_password](#input\_eventBridge\_connection\_auth\_basic\_password) | Specifies the password for basic authorization | `string` | `null` | no |
| <a name="input_eventBridge_connection_auth_basic_username"></a> [eventBridge\_connection\_auth\_basic\_username](#input\_eventBridge\_connection\_auth\_basic\_username) | Specifies the username for basic authorization | `string` | `null` | no |
| <a name="input_eventBridge_connection_auth_parameters"></a> [eventBridge\_connection\_auth\_parameters](#input\_eventBridge\_connection\_auth\_parameters) | Specifies if we will be creating auth parameters for the eventBridge connection | `bool` | `false` | no |
| <a name="input_eventBridge_connection_auth_params_api_key"></a> [eventBridge\_connection\_auth\_params\_api\_key](#input\_eventBridge\_connection\_auth\_params\_api\_key) | Specifies the api key for api key authorization | `string` | `null` | no |
| <a name="input_eventBridge_connection_auth_params_api_value"></a> [eventBridge\_connection\_auth\_params\_api\_value](#input\_eventBridge\_connection\_auth\_params\_api\_value) | Specifies the api value for api key authorization | `string` | `null` | no |
| <a name="input_eventBridge_connection_authorization_type"></a> [eventBridge\_connection\_authorization\_type](#input\_eventBridge\_connection\_authorization\_type) | Choose the type of authorization to use for the connection. One of API\_KEY,BASIC,OAUTH\_CLIENT\_CREDENTIALS. | `string` | `"BASIC"` | no |
| <a name="input_eventBridge_connection_description"></a> [eventBridge\_connection\_description](#input\_eventBridge\_connection\_description) | Specifies the description of the eventBridge connection | `string` | `null` | no |
| <a name="input_eventBridge_connection_name"></a> [eventBridge\_connection\_name](#input\_eventBridge\_connection\_name) | Specifies the name of the eventBridge connection | `string` | `null` | no |
| <a name="input_eventBridge_connnection_is_auth_api_key"></a> [eventBridge\_connnection\_is\_auth\_api\_key](#input\_eventBridge\_connnection\_is\_auth\_api\_key) | Specifies if we will be creating api key auth parameters for the eventBridge connection | `bool` | `false` | no |
| <a name="input_eventBridge_connnection_is_auth_basic"></a> [eventBridge\_connnection\_is\_auth\_basic](#input\_eventBridge\_connnection\_is\_auth\_basic) | Specifies if we will be creating basic auth parameters for the eventBridge connection | `bool` | `false` | no |
| <a name="input_eventBridge_http_target_header_parameters"></a> [eventBridge\_http\_target\_header\_parameters](#input\_eventBridge\_http\_target\_header\_parameters) | Specifies the header parameters for the http target | `map(string)` | `null` | no |
| <a name="input_eventBridge_http_target_path_parameter_values"></a> [eventBridge\_http\_target\_path\_parameter\_values](#input\_eventBridge\_http\_target\_path\_parameter\_values) | The list of values that correspond sequentially to any path variables in your endpoint ARN | `list(string)` | `null` | no |
| <a name="input_eventBridge_http_target_query_string_parameters"></a> [eventBridge\_http\_target\_query\_string\_parameters](#input\_eventBridge\_http\_target\_query\_string\_parameters) | Represents keys/values of query string parameters that are appended to the invoked endpoint. | `map(string)` | `null` | no |
| <a name="input_eventBridge_is_connection"></a> [eventBridge\_is\_connection](#input\_eventBridge\_is\_connection) | Specifies whether to create an eventBridge connection | `bool` | `false` | no |
| <a name="input_eventBridge_is_http_targets"></a> [eventBridge\_is\_http\_targets](#input\_eventBridge\_is\_http\_targets) | Specifies whether to create http target in the event target | `bool` | `false` | no |
| <a name="input_eventBridge_role_arn"></a> [eventBridge\_role\_arn](#input\_eventBridge\_role\_arn) | Specifies The arn of the IAM role to be used for this target when the rule is triggered. Required if ecs\_target is used or target in arn is EC2 instance, Kinesis data stream, Step Functions state machine, or Event Bus in different account or region. | `string` | `null` | no |
| <a name="input_eventBridge_rule_description"></a> [eventBridge\_rule\_description](#input\_eventBridge\_rule\_description) | Specifies the description of the eventBridge rule | `string` | n/a | yes |
| <a name="input_eventBridge_rule_event_pattern"></a> [eventBridge\_rule\_event\_pattern](#input\_eventBridge\_rule\_event\_pattern) | Specifies the event pattern to match | `string` | n/a | yes |
| <a name="input_eventBridge_rule_name"></a> [eventBridge\_rule\_name](#input\_eventBridge\_rule\_name) | Specifies the name of the eventBridge rule | `string` | n/a | yes |
| <a name="input_eventBridge_rule_role_name"></a> [eventBridge\_rule\_role\_name](#input\_eventBridge\_rule\_role\_name) | Specifies the name of the role for the eventBridge rule | `string` | n/a | yes |
| <a name="input_eventBridge_rule_schedule_expression"></a> [eventBridge\_rule\_schedule\_expression](#input\_eventBridge\_rule\_schedule\_expression) | Specifies the schedule expression for the eventBridge rule | `string` | `null` | no |
| <a name="input_eventBridge_tags"></a> [eventBridge\_tags](#input\_eventBridge\_tags) | Specifies the tags (key, value pairs) to be associated with the eventBridge rule | `map(string)` | n/a | yes |
| <a name="input_eventBridge_target_arn"></a> [eventBridge\_target\_arn](#input\_eventBridge\_target\_arn) | Specifies the arn of the target | `string` | n/a | yes |
| <a name="input_eventBridge_target_id"></a> [eventBridge\_target\_id](#input\_eventBridge\_target\_id) | Specifies the unique target assignment ID | `string` | n/a | yes |
| <a name="input_is_eventBridge_api_destination"></a> [is\_eventBridge\_api\_destination](#input\_is\_eventBridge\_api\_destination) | Specifies whether to create an eventBridge api destination | `bool` | `false` | no |
| <a name="input_is_eventBridge_rule_enabled"></a> [is\_eventBridge\_rule\_enabled](#input\_is\_eventBridge\_rule\_enabled) | Specifies whether the eventBridge rule is enabled | `bool` | `true` | no |
| <a name="input_region"></a> [region](#input\_region) | Specfies the region in which this resouce will be created in | `string` | `"af-south-1"` | no |
| <a name="input_run_command_targets"></a> [run\_command\_targets](#input\_run\_command\_targets) | Specifies the targets for the run command | `map(list(string))` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_event_bridge_api_dest_arn"></a> [event\_bridge\_api\_dest\_arn](#output\_event\_bridge\_api\_dest\_arn) | The ARN of the EventBridge api destination |
| <a name="output_event_bridge_bus_arn"></a> [event\_bridge\_bus\_arn](#output\_event\_bridge\_bus\_arn) | The ARN of the EventBridge bus |
| <a name="output_event_bridge_conection_arn"></a> [event\_bridge\_conection\_arn](#output\_event\_bridge\_conection\_arn) | The ARN of the EventBridge connection |
| <a name="output_event_bridge_rule_arn"></a> [event\_bridge\_rule\_arn](#output\_event\_bridge\_rule\_arn) | The ARN of the EventBridge rule |
| <a name="output_event_bridge_rule_id"></a> [event\_bridge\_rule\_id](#output\_event\_bridge\_rule\_id) | The ID of the EventBridge rule |
<!-- END_TF_DOCS -->