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
| [aws_iam_role.subscription_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_kms_key.sns_kms_key](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_key) | resource |
| [aws_sns_topic.sns_topic](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sns_topic) | resource |
| [aws_sns_topic_policy.topic_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sns_topic_policy) | resource |
| [aws_sns_topic_subscription.subscription_for_application](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sns_topic_subscription) | resource |
| [aws_sns_topic_subscription.subscription_for_email](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sns_topic_subscription) | resource |
| [aws_sns_topic_subscription.subscription_for_firehose](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sns_topic_subscription) | resource |
| [aws_sns_topic_subscription.subscription_for_lambda](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sns_topic_subscription) | resource |
| [aws_iam_policy_document.policy_doc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.subscription_role_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_sns_tags"></a> [sns\_tags](#input\_sns\_tags) | Specify the tags (Key, Value pair) for the sns topic being created | `map(string)` | n/a | yes |
| <a name="input_sns_topic_name"></a> [sns\_topic\_name](#input\_sns\_topic\_name) | Specifies the SNS topic name | `string` | n/a | yes |
| <a name="input_delivery_policy"></a> [delivery\_policy](#input\_delivery\_policy) | Delivery policy for SNS topic | `string` | `"{\n  \"http\": {\n    \"defaultHealthyRetryPolicy\": {\n      \"minDelayTarget\": 20,\n      \"maxDelayTarget\": 20,\n      \"numRetries\": 3,\n      \"numMaxDelayRetries\": 0,\n      \"numNoDelayRetries\": 0,\n      \"numMinDelayRetries\": 0,\n      \"backoffFunction\": \"linear\"\n    },\n    \"disableSubscriptionOverrides\": false,\n    \"defaultThrottlePolicy\": {\n      \"maxReceivesPerSecond\": 1\n    }\n  }\n}\n"` | no |
| <a name="input_is_application_subscription"></a> [is\_application\_subscription](#input\_is\_application\_subscription) | Specifies whether we create an SNS subscription for an application | `bool` | `false` | no |
| <a name="input_is_content_based_deduplication"></a> [is\_content\_based\_deduplication](#input\_is\_content\_based\_deduplication) | Specifies whether our content based deduplication will be on | `bool` | `false` | no |
| <a name="input_is_create_subscription_role"></a> [is\_create\_subscription\_role](#input\_is\_create\_subscription\_role) | Specify whether to create a subcription role | `bool` | `false` | no |
| <a name="input_is_email_subscription"></a> [is\_email\_subscription](#input\_is\_email\_subscription) | Specify whether to create the sns topic subscription for an email | `bool` | `false` | no |
| <a name="input_is_fifo_topic"></a> [is\_fifo\_topic](#input\_is\_fifo\_topic) | Specifies whether our SNS topic will be fifo | `bool` | `false` | no |
| <a name="input_is_firehose_subscription"></a> [is\_firehose\_subscription](#input\_is\_firehose\_subscription) | Specifies whether we create an SNS subscription for a firehose delivery stream pointing to a kinesis stream | `bool` | `false` | no |
| <a name="input_is_lambda_subscription"></a> [is\_lambda\_subscription](#input\_is\_lambda\_subscription) | Specify whether to create the sns topic subscription for a lambda | `bool` | `false` | no |
| <a name="input_kinesis_delivery_stream_arn"></a> [kinesis\_delivery\_stream\_arn](#input\_kinesis\_delivery\_stream\_arn) | Specify the firehose delivery stream arn that points to kinesis stream | `string` | `""` | no |
| <a name="input_policy_doc_actions"></a> [policy\_doc\_actions](#input\_policy\_doc\_actions) | Specify what actions will be permitted in your iam policy document | `set(string)` | <pre>[<br>  "SNS:Subscribe",<br>  "SNS:SetTopicAttributes",<br>  "SNS:RemovePermission",<br>  "SNS:Receive",<br>  "SNS:Publish",<br>  "SNS:ListSubscriptionsByTopic",<br>  "SNS:GetTopicAttributes",<br>  "SNS:DeleteTopic",<br>  "SNS:AddPermission"<br>]</pre> | no |
| <a name="input_policy_identifiers"></a> [policy\_identifiers](#input\_policy\_identifiers) | Specify the policy identifiers for the iam policy document | `set(string)` | <pre>[<br>  "*"<br>]</pre> | no |
| <a name="input_region"></a> [region](#input\_region) | Specfies the region in which this resouce will be created in | `string` | `"af-south-1"` | no |
| <a name="input_subscription_application_endpoint"></a> [subscription\_application\_endpoint](#input\_subscription\_application\_endpoint) | Specfies the application arn/endpoint that you want to attach to the subscription | `string` | `""` | no |
| <a name="input_subscription_email_endpoint"></a> [subscription\_email\_endpoint](#input\_subscription\_email\_endpoint) | Specify the email address as the endpoint | `string` | `""` | no |
| <a name="input_subscription_iam_name"></a> [subscription\_iam\_name](#input\_subscription\_iam\_name) | Specify name for the subscription Iam role created for the firehose subscription | `string` | `"value"` | no |
| <a name="input_subscription_lambda_endpoint"></a> [subscription\_lambda\_endpoint](#input\_subscription\_lambda\_endpoint) | Specify the lambda arn as the endpoint | `string` | `""` | no |
| <a name="input_subscription_policy_doc_actions"></a> [subscription\_policy\_doc\_actions](#input\_subscription\_policy\_doc\_actions) | Specify the actions to be used in the polic doc for the subscription role | `set(string)` | `[]` | no |
| <a name="input_subscription_policy_identifiers"></a> [subscription\_policy\_identifiers](#input\_subscription\_policy\_identifiers) | value | `set(string)` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_sns_application_subscription_arn"></a> [sns\_application\_subscription\_arn](#output\_sns\_application\_subscription\_arn) | Output the SNS application subscription arn |
| <a name="output_sns_email_subscription_arn"></a> [sns\_email\_subscription\_arn](#output\_sns\_email\_subscription\_arn) | Output the SNS email subscription arn |
| <a name="output_sns_firehose_subscription_arn"></a> [sns\_firehose\_subscription\_arn](#output\_sns\_firehose\_subscription\_arn) | Output the SNS firehose subscription arn |
| <a name="output_sns_lambda_subscription_arn"></a> [sns\_lambda\_subscription\_arn](#output\_sns\_lambda\_subscription\_arn) | Output the SNS email subscription arn |
| <a name="output_sns_topic_arn"></a> [sns\_topic\_arn](#output\_sns\_topic\_arn) | Output the arn of the created SNS topic |
| <a name="output_sns_topic_id"></a> [sns\_topic\_id](#output\_sns\_topic\_id) | Output the id of the created SNS topic |
| <a name="output_sns_topic_name"></a> [sns\_topic\_name](#output\_sns\_topic\_name) | Output the name of the created SNS topic |
