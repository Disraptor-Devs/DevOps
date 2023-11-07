## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_cloudwatch_composite_alarm.composite_alarm](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_composite_alarm) | resource |
| [aws_cloudwatch_metric_alarm.metric_alarm](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_metric_alarm) | resource |
| [aws_cloudwatch_metric_stream.metric_stream](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_metric_stream) | resource |
| [aws_iam_role.metric_stream_to_firehose](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy.metric_stream_to_firehose_policy_attachment](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy) | resource |
| [aws_iam_policy_document.metric_stream_to_firehose](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.streams_assume_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_firehose_delivery_stream_arn"></a> [firehose\_delivery\_stream\_arn](#input\_firehose\_delivery\_stream\_arn) | Specify the arn of the firehose delivery stream to use for this metric stream | `string` | n/a | yes |
| <a name="input_metric_alarm_comparison_operator"></a> [metric\_alarm\_comparison\_operator](#input\_metric\_alarm\_comparison\_operator) | Specifies thhe arithmetic operation to use when comparing the specified Statistic and Threshold. The specified Statistic value is used as the first operand. | `string` | n/a | yes |
| <a name="input_metric_alarm_description"></a> [metric\_alarm\_description](#input\_metric\_alarm\_description) | Specifies the description of the metric alarm | `string` | n/a | yes |
| <a name="input_metric_alarm_evaluation_periods"></a> [metric\_alarm\_evaluation\_periods](#input\_metric\_alarm\_evaluation\_periods) | Specifies the number of periods over which data is compared to the specified threshold. | `number` | n/a | yes |
| <a name="input_metric_alarm_name"></a> [metric\_alarm\_name](#input\_metric\_alarm\_name) | Specifies the name of the metric alarm | `string` | n/a | yes |
| <a name="input_metric_alarm_namespace"></a> [metric\_alarm\_namespace](#input\_metric\_alarm\_namespace) | Specify the namespace for the alarm's associated metric | `string` | n/a | yes |
| <a name="input_metric_alarm_tags"></a> [metric\_alarm\_tags](#input\_metric\_alarm\_tags) | Specify the tags (key, value pairs) to be associated with the metric alarm | `map(string)` | n/a | yes |
| <a name="input_metric_stream_filters"></a> [metric\_stream\_filters](#input\_metric\_stream\_filters) | Specify the filters for the metric stream | `map(string, set(string))` | n/a | yes |
| <a name="input_metric_stream_name"></a> [metric\_stream\_name](#input\_metric\_stream\_name) | Specify the name of the metric stream | `string` | n/a | yes |
| <a name="input_actions_suppressor_alarm_name_or_arn"></a> [actions\_suppressor\_alarm\_name\_or\_arn](#input\_actions\_suppressor\_alarm\_name\_or\_arn) | Specify the name or arn of the alarm to which the suppression will be applied | `string` | `null` | no |
| <a name="input_actions_suppressor_extension_period"></a> [actions\_suppressor\_extension\_period](#input\_actions\_suppressor\_extension\_period) | Specify the maximum time in seconds that the composite alarm waits after suppressor alarm goes out of the ALARM state. After this time, the composite alarm performs its actions. | `number` | `null` | no |
| <a name="input_actions_suppressor_wait_period"></a> [actions\_suppressor\_wait\_period](#input\_actions\_suppressor\_wait\_period) | Specify the maximum time in seconds that the composite alarm waits for the suppressor alarm to go into the ALARM state. After this time, the composite alarm performs its actions. | `number` | `null` | no |
| <a name="input_alarm_actions_arns"></a> [alarm\_actions\_arns](#input\_alarm\_actions\_arns) | Specify the list of actions to execute when this alarm transitions into an ALARM state from any other state. Each action is specified as an ARN. | `list(string)` | `null` | no |
| <a name="input_composite_alarm_description"></a> [composite\_alarm\_description](#input\_composite\_alarm\_description) | Specify the description of the composite alarm | `string` | `null` | no |
| <a name="input_composite_alarm_name"></a> [composite\_alarm\_name](#input\_composite\_alarm\_name) | Specify the name of the composite alarm | `string` | `null` | no |
| <a name="input_composite_alarm_rule"></a> [composite\_alarm\_rule](#input\_composite\_alarm\_rule) | Specify the rule for the composite alarm | `string` | `null` | no |
| <a name="input_is_actions_enabled"></a> [is\_actions\_enabled](#input\_is\_actions\_enabled) | Specify whether the actions for the composite alarm are enabled | `bool` | `false` | no |
| <a name="input_is_create_composite_alarm"></a> [is\_create\_composite\_alarm](#input\_is\_create\_composite\_alarm) | Specify whether to create a composite alarm | `bool` | `false` | no |
| <a name="input_metric_alarm_insufficient_data_actions"></a> [metric\_alarm\_insufficient\_data\_actions](#input\_metric\_alarm\_insufficient\_data\_actions) | Specify the list of actions to execute when this alarm transitions into an INSUFFICIENT\_DATA state from any other state. Each action is specified as an ARN | `list(string)` | `null` | no |
| <a name="input_metric_alarm_period"></a> [metric\_alarm\_period](#input\_metric\_alarm\_period) | Specify tThe period in seconds over which the specified statistic is applied. Valid values are 10, 30, or any multiple of 60. | `number` | `null` | no |
| <a name="input_metric_alarm_statistic"></a> [metric\_alarm\_statistic](#input\_metric\_alarm\_statistic) | Specify the statistic to apply to the alarm's associated metric. Either of the following is supported: SampleCount, Average, Sum, Minimum, Maximum | `string` | `null` | no |
| <a name="input_metric_alarm_threshold"></a> [metric\_alarm\_threshold](#input\_metric\_alarm\_threshold) | Specify the value against which the specified statistic is compared. | `number` | `null` | no |
| <a name="input_metric_name"></a> [metric\_name](#input\_metric\_name) | Specify the name for the alarm's associated metric | `string` | `null` | no |
| <a name="input_metric_stream_output_format"></a> [metric\_stream\_output\_format](#input\_metric\_stream\_output\_format) | Specify the output format for the metric stream | `string` | `"json"` | no |
| <a name="input_ok_actions_arns"></a> [ok\_actions\_arns](#input\_ok\_actions\_arns) | Specify the list of actions to execute when this alarm transitions into an OK state from any other state. Each action is specified as an ARN. | `list(string)` | `null` | no |
| <a name="input_region"></a> [region](#input\_region) | Specfies the region in which this resouce will be created in | `string` | `"af-south-1"` | no |

## Outputs

No outputs.
