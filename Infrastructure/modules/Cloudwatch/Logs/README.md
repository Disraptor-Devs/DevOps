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
| [aws_cloudwatch_log_destination.cw_log_destination](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_destination) | resource |
| [aws_cloudwatch_log_destination_policy.log_destination_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_destination_policy) | resource |
| [aws_cloudwatch_log_group.log_group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_group) | resource |
| [aws_cloudwatch_log_metric_filter.metric_filter](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_metric_filter) | resource |
| [aws_cloudwatch_log_stream.log_stream](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_stream) | resource |
| [aws_cloudwatch_log_subscription_filter.log_subscription_filter](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_subscription_filter) | resource |
| [aws_iam_role.cw_log_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.cw_log_kinesis_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.cw_log_s3_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_kms_key.bucket_kms_key](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_key) | resource |
| [aws_iam_policy_document.cw_log_role_doc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.log_destination_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cw_log_role_name"></a> [cw\_log\_role\_name](#input\_cw\_log\_role\_name) | Specifies the name of the iam role to be created for cloudwatch logs | `string` | n/a | yes |
| <a name="input_log_group_name"></a> [log\_group\_name](#input\_log\_group\_name) | Specifies the name of the log group | `string` | n/a | yes |
| <a name="input_log_tags"></a> [log\_tags](#input\_log\_tags) | Specifies the tags (key, value pairs) to be associated with the log group | `map(string)` | n/a | yes |
| <a name="input_is_log_destination"></a> [is\_log\_destination](#input\_is\_log\_destination) | Specifies whether to create a log destination | `bool` | `false` | no |
| <a name="input_is_log_metric_filter"></a> [is\_log\_metric\_filter](#input\_is\_log\_metric\_filter) | Specifies whether to create a log metric filter | `bool` | `false` | no |
| <a name="input_is_log_stream"></a> [is\_log\_stream](#input\_is\_log\_stream) | Specifies whether to create a log stream | `bool` | `false` | no |
| <a name="input_is_log_subscription_filter"></a> [is\_log\_subscription\_filter](#input\_is\_log\_subscription\_filter) | Specifies whether to create a log subscription filter | `bool` | `false` | no |
| <a name="input_log_destination_name"></a> [log\_destination\_name](#input\_log\_destination\_name) | Specifies the name of the log destination | `string` | `null` | no |
| <a name="input_log_group_retention_in_days"></a> [log\_group\_retention\_in\_days](#input\_log\_group\_retention\_in\_days) | Specifies the number of days log events are kept in CloudWatch Logs | `number` | `null` | no |
| <a name="input_log_metric_filter_name"></a> [log\_metric\_filter\_name](#input\_log\_metric\_filter\_name) | Specifies the name of the log metric filter | `string` | `null` | no |
| <a name="input_log_metric_filter_pattern"></a> [log\_metric\_filter\_pattern](#input\_log\_metric\_filter\_pattern) | Specifies the pattern to use for filtering a log metric filter | `string` | `null` | no |
| <a name="input_log_stream_name"></a> [log\_stream\_name](#input\_log\_stream\_name) | Specifies the name of the log stream | `string` | `null` | no |
| <a name="input_log_subscription_filter_destination_arn"></a> [log\_subscription\_filter\_destination\_arn](#input\_log\_subscription\_filter\_destination\_arn) | Specifies the destination arn to use for filtering a log subscription filter | `string` | `null` | no |
| <a name="input_log_subscription_filter_name"></a> [log\_subscription\_filter\_name](#input\_log\_subscription\_filter\_name) | Specifies the name of the log subscription filter | `string` | `null` | no |
| <a name="input_log_subscription_filter_pattern"></a> [log\_subscription\_filter\_pattern](#input\_log\_subscription\_filter\_pattern) | Specifies the pattern to use for filtering a log subscription filter | `string` | `null` | no |
| <a name="input_metric_tranformation_name"></a> [metric\_tranformation\_name](#input\_metric\_tranformation\_name) | Specifies the name of the metric transformation | `string` | `null` | no |
| <a name="input_metric_tranformation_namespace"></a> [metric\_tranformation\_namespace](#input\_metric\_tranformation\_namespace) | Specifies the namespace of the metric transformation | `string` | `null` | no |
| <a name="input_metric_tranformation_value"></a> [metric\_tranformation\_value](#input\_metric\_tranformation\_value) | Specifies the value of the metric transformation | `string` | `null` | no |
| <a name="input_region"></a> [region](#input\_region) | Specfies the region in which this resouce will be created in | `string` | `"af-south-1"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_log_destination_arn"></a> [log\_destination\_arn](#output\_log\_destination\_arn) | The ARN of the log destination |
| <a name="output_log_group_arn"></a> [log\_group\_arn](#output\_log\_group\_arn) | The ARN of the log group |
| <a name="output_log_metric_filter_id"></a> [log\_metric\_filter\_id](#output\_log\_metric\_filter\_id) | The ID of the log metric filter |
| <a name="output_log_stream_arn"></a> [log\_stream\_arn](#output\_log\_stream\_arn) | The ARN of the log stream |
