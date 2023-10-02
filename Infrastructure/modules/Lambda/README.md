## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 2.70.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_archive"></a> [archive](#provider\_archive) | n/a |
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 2.70.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_iam_role.iam_for_lambda](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.laambda_s3_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.laambda_sns_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.lambda_kinesis_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_lambda_alias.lambda_alias](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lambda_alias) | resource |
| [aws_lambda_event_source_mapping.event_source_kinesis](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lambda_event_source_mapping) | resource |
| [aws_lambda_event_source_mapping.event_source_msk](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lambda_event_source_mapping) | resource |
| [aws_lambda_function.lambda_function](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lambda_function) | resource |
| [aws_lambda_function_url.lambda_url](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lambda_function_url) | resource |
| [aws_lambda_permission.allow_cloudwatch](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lambda_permission) | resource |
| [aws_lambda_permission.allow_s3](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lambda_permission) | resource |
| [aws_lambda_permission.allow_sns](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lambda_permission) | resource |
| [aws_lambda_provisioned_concurrency_config.concurrency_allocation](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lambda_provisioned_concurrency_config) | resource |
| [archive_file.lambda](https://registry.terraform.io/providers/hashicorp/archive/latest/docs/data-sources/file) | data source |
| [aws_iam_policy_document.assume_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_function_name"></a> [function\_name](#input\_function\_name) | Specify the name of the lambda function being created | `string` | n/a | yes |
| <a name="input_lambda_alias_description"></a> [lambda\_alias\_description](#input\_lambda\_alias\_description) | Specify the description for the lambda alias. | `string` | n/a | yes |
| <a name="input_lambda_alias_function_version"></a> [lambda\_alias\_function\_version](#input\_lambda\_alias\_function\_version) | Specify the version for the lambda function being associated to the alias. | `string` | n/a | yes |
| <a name="input_lambda_alias_name"></a> [lambda\_alias\_name](#input\_lambda\_alias\_name) | Specify the name to use for the lambda alias being created. | `string` | n/a | yes |
| <a name="input_lambda_function_runtime"></a> [lambda\_function\_runtime](#input\_lambda\_function\_runtime) | Specify the runtime for the lambda function | `string` | n/a | yes |
| <a name="input_lambda_iam_role_name"></a> [lambda\_iam\_role\_name](#input\_lambda\_iam\_role\_name) | Specify the name for the Iam role that will be created for the lambda function | `string` | n/a | yes |
| <a name="input_lambda_tags"></a> [lambda\_tags](#input\_lambda\_tags) | Specifies the tags (Key, Value pairs) to be associated to the lambda resources | `map(string)` | n/a | yes |
| <a name="input_archive_type"></a> [archive\_type](#input\_archive\_type) | Specify the Archive type to be used for the file/code you're referencing | `string` | `"ZIP"` | no |
| <a name="input_cloudwatch_arn"></a> [cloudwatch\_arn](#input\_cloudwatch\_arn) | Specify the Cloudwatch arn you want to give permission to perform an action on the lambda function | `string` | `""` | no |
| <a name="input_concurrent_excutions"></a> [concurrent\_excutions](#input\_concurrent\_excutions) | Amount of capacity to allocate | `number` | `1` | no |
| <a name="input_event_starting_position"></a> [event\_starting\_position](#input\_event\_starting\_position) | Specify the starting position for the event source mapping | `string` | `"LATEST"` | no |
| <a name="input_is_allow_cloudwatch_action_on_lambda"></a> [is\_allow\_cloudwatch\_action\_on\_lambda](#input\_is\_allow\_cloudwatch\_action\_on\_lambda) | Specify whether we'll allow Cloudwatch an action on the lambda function | `bool` | `false` | no |
| <a name="input_is_allow_s3_action_on_lambda"></a> [is\_allow\_s3\_action\_on\_lambda](#input\_is\_allow\_s3\_action\_on\_lambda) | Specify whether we'll allow S3 an action on the lambda function | `bool` | `false` | no |
| <a name="input_is_allow_sns_action_on_lambda"></a> [is\_allow\_sns\_action\_on\_lambda](#input\_is\_allow\_sns\_action\_on\_lambda) | Specify whether we'll allow SNS an action on the lambda function | `bool` | `false` | no |
| <a name="input_is_deployment_package_local"></a> [is\_deployment\_package\_local](#input\_is\_deployment\_package\_local) | Specify whether the zip file with the code for the lambda function is stored on S3. | `bool` | `false` | no |
| <a name="input_is_function_variables"></a> [is\_function\_variables](#input\_is\_function\_variables) | Specify whether we'll pass in environment variables for our lambda function | `bool` | `false` | no |
| <a name="input_is_kafka_event_source_config"></a> [is\_kafka\_event\_source\_config](#input\_is\_kafka\_event\_source\_config) | Specify whether to add in the kafka event source config block for the msk event source mapping | `bool` | `false` | no |
| <a name="input_is_kinesis_event_source"></a> [is\_kinesis\_event\_source](#input\_is\_kinesis\_event\_source) | Specify whether to create the event source mapping for a kinesis stream | `bool` | `false` | no |
| <a name="input_is_lambda_function_url"></a> [is\_lambda\_function\_url](#input\_is\_lambda\_function\_url) | Specify whether we'll create a url for our lambda function | `bool` | `false` | no |
| <a name="input_is_lambda_provisioned_concurrency"></a> [is\_lambda\_provisioned\_concurrency](#input\_is\_lambda\_provisioned\_concurrency) | Specify whether we provision concurrency or our lambda function | `bool` | `false` | no |
| <a name="input_is_msk_cluster_event_source"></a> [is\_msk\_cluster\_event\_source](#input\_is\_msk\_cluster\_event\_source) | Specify whether to create the event source mapping for msk | `bool` | `false` | no |
| <a name="input_kinesis_stream_arn"></a> [kinesis\_stream\_arn](#input\_kinesis\_stream\_arn) | Specify the kinesis stream arn to be used in the event source mapping | `string` | `""` | no |
| <a name="input_lambda_function_url_auth_type"></a> [lambda\_function\_url\_auth\_type](#input\_lambda\_function\_url\_auth\_type) | The type of authentication that the function URL uses. | `string` | `"AWS_IAM"` | no |
| <a name="input_lambda_function_url_cors_allow_credentials"></a> [lambda\_function\_url\_cors\_allow\_credentials](#input\_lambda\_function\_url\_cors\_allow\_credentials) | Whether to allow cookies or other credentials in requests to the function URL. | `bool` | `false` | no |
| <a name="input_lambda_function_url_cors_allow_headers"></a> [lambda\_function\_url\_cors\_allow\_headers](#input\_lambda\_function\_url\_cors\_allow\_headers) | The HTTP headers that origins can include in requests to the function URL. For example: [date, keep-alive, x-custom-header]. | `set(string)` | <pre>[<br>  "date",<br>  "keep-alive"<br>]</pre> | no |
| <a name="input_lambda_function_url_cors_allow_methods"></a> [lambda\_function\_url\_cors\_allow\_methods](#input\_lambda\_function\_url\_cors\_allow\_methods) | The HTTP methods that are allowed when calling the function URL. For example: [GET, POST, DELETE]. | `set(string)` | <pre>[<br>  "*"<br>]</pre> | no |
| <a name="input_lambda_function_url_cors_allow_origins"></a> [lambda\_function\_url\_cors\_allow\_origins](#input\_lambda\_function\_url\_cors\_allow\_origins) | The origins that can access the function URL. | `set(string)` | <pre>[<br>  "*"<br>]</pre> | no |
| <a name="input_lambda_function_url_cors_expose_headers"></a> [lambda\_function\_url\_cors\_expose\_headers](#input\_lambda\_function\_url\_cors\_expose\_headers) | The HTTP headers in your function response that you want to expose to origins that call the function URL. | `set(string)` | <pre>[<br>  "keep-alive",<br>  "date"<br>]</pre> | no |
| <a name="input_lambda_function_url_cors_max_age"></a> [lambda\_function\_url\_cors\_max\_age](#input\_lambda\_function\_url\_cors\_max\_age) | The maximum amount of time, in seconds, that web browsers can cache results of a preflight request. | `number` | `0` | no |
| <a name="input_lambda_handler"></a> [lambda\_handler](#input\_lambda\_handler) | Specify entry point of your function | `string` | `null` | no |
| <a name="input_lambda_permission_action"></a> [lambda\_permission\_action](#input\_lambda\_permission\_action) | Specify the action that will be allowed on the lambda function (to be used in aws lambda permission) | `string` | `"lambda:InvokeFunction"` | no |
| <a name="input_lambda_permission_statement_id"></a> [lambda\_permission\_statement\_id](#input\_lambda\_permission\_statement\_id) | Specify the statement id for the aws lambda permission | `string` | `""` | no |
| <a name="input_lambda_variables"></a> [lambda\_variables](#input\_lambda\_variables) | Specify variables for our lambda function | `map(string)` | `{}` | no |
| <a name="input_managed_kafka_consumer_group_id"></a> [managed\_kafka\_consumer\_group\_id](#input\_managed\_kafka\_consumer\_group\_id) | Specify the consumer group id for the amazon\_managed\_kafka\_event\_source\_config | `string` | `""` | no |
| <a name="input_msk_cluster_arn"></a> [msk\_cluster\_arn](#input\_msk\_cluster\_arn) | Specify the msk cluster arn to be used in the event source mapping | `string` | `""` | no |
| <a name="input_msk_topics"></a> [msk\_topics](#input\_msk\_topics) | Specify the topics used in the msk cluster | `set(string)` | `[]` | no |
| <a name="input_output_path"></a> [output\_path](#input\_output\_path) | Specify the output name of the zipped file/code | `string` | `""` | no |
| <a name="input_path_to_code"></a> [path\_to\_code](#input\_path\_to\_code) | Specify the path to where your file/code is located | `string` | `""` | no |
| <a name="input_region"></a> [region](#input\_region) | Specfies the region in which this resouce will be created in | `string` | `"af-south-1"` | no |
| <a name="input_s3_bucket_arn"></a> [s3\_bucket\_arn](#input\_s3\_bucket\_arn) | Specify the S3 bucket arn you want to give permission to perform an action on the lambda function | `string` | `""` | no |
| <a name="input_s3_bucket_for_lambda"></a> [s3\_bucket\_for\_lambda](#input\_s3\_bucket\_for\_lambda) | Specify the S3 bucket where your code for the lambda function lives. | `string` | `""` | no |
| <a name="input_s3_key_to_code_for_lambda"></a> [s3\_key\_to\_code\_for\_lambda](#input\_s3\_key\_to\_code\_for\_lambda) | Specify the S3 key to your code for the lambda function. | `string` | `""` | no |
| <a name="input_sns_arn"></a> [sns\_arn](#input\_sns\_arn) | Specify the SNS arn you want to give permission to perform an action on the lambda function | `string` | `""` | no |
| <a name="input_sns_failure_topic_arn"></a> [sns\_failure\_topic\_arn](#input\_sns\_failure\_topic\_arn) | Specify the arn for the sns topic that will be used for failures | `string` | `""` | no |
| <a name="input_starting_pos_timestamp"></a> [starting\_pos\_timestamp](#input\_starting\_pos\_timestamp) | Specify the starting position timestamp only if event\_starting\_position is set to AT\_TIMESTAMP | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_event_source_kinesis_state"></a> [event\_source\_kinesis\_state](#output\_event\_source\_kinesis\_state) | Output the event source mapping for Kinesis' current state |
| <a name="output_event_source_msk_state"></a> [event\_source\_msk\_state](#output\_event\_source\_msk\_state) | Output the event source mapping for MSK's current state |
| <a name="output_lambda_alias_arn"></a> [lambda\_alias\_arn](#output\_lambda\_alias\_arn) | Output the Lambda Alias arn |
| <a name="output_lambda_alias_id"></a> [lambda\_alias\_id](#output\_lambda\_alias\_id) | Output the Lambda Alias id |
| <a name="output_lambda_alias_name"></a> [lambda\_alias\_name](#output\_lambda\_alias\_name) | Output the Lambda Alias qualifying name |
| <a name="output_lambda_function_arn"></a> [lambda\_function\_arn](#output\_lambda\_function\_arn) | Output the Lambda Function arn |
| <a name="output_lambda_function_id"></a> [lambda\_function\_id](#output\_lambda\_function\_id) | Output the Lambda Function id |
| <a name="output_lambda_function_name"></a> [lambda\_function\_name](#output\_lambda\_function\_name) | Output the Lambda Function name |
