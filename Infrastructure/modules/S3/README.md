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
| [aws_kms_key.bucket_kms_key](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_key) | resource |
| [aws_s3_bucket.logging_bucket](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket) | resource |
| [aws_s3_bucket.s3_bucket](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket) | resource |
| [aws_s3_bucket_acl.aws_s3_bucket_acl](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_acl) | resource |
| [aws_s3_bucket_acl.log_bucket_acl](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_acl) | resource |
| [aws_s3_bucket_logging.bucket_logging](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_logging) | resource |
| [aws_s3_bucket_notification.bucket_notification](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_notification) | resource |
| [aws_s3_bucket_policy.bucket_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_policy) | resource |
| [aws_s3_bucket_server_side_encryption_configuration.s3_bucket_encryption](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_server_side_encryption_configuration) | resource |
| [aws_s3_bucket_versioning.versioning](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_versioning) | resource |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_iam_policy_document.bucket_policy_doc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_s3_bucket_name"></a> [s3\_bucket\_name](#input\_s3\_bucket\_name) | Specifies the name of the bucket being created | `string` | n/a | yes |
| <a name="input_s3_policy_actions"></a> [s3\_policy\_actions](#input\_s3\_policy\_actions) | Specify a list of actions to attach to the s3 bucket policy | `list(string)` | n/a | yes |
| <a name="input_s3_tags"></a> [s3\_tags](#input\_s3\_tags) | Specify the tags (key, value pairs) to be associated with the S3 bucket | `map(string)` | n/a | yes |
| <a name="input_is_logging_bucket"></a> [is\_logging\_bucket](#input\_is\_logging\_bucket) | Specifies whether we need to create a logging bucket for the main bucket being created | `bool` | `false` | no |
| <a name="input_region"></a> [region](#input\_region) | Specfies the region in which this resouce will be created in | `string` | `"af-south-1"` | no |
| <a name="input_s3_bucket_acl"></a> [s3\_bucket\_acl](#input\_s3\_bucket\_acl) | Specifies whether the s3 bucket will be private or public-facing | `string` | `"private"` | no |
| <a name="input_s3_bucket_notification_events"></a> [s3\_bucket\_notification\_events](#input\_s3\_bucket\_notification\_events) | Specifies the events we want to be notified off on the created S3 bucket | `list(string)` | <pre>[<br>  ""<br>]</pre> | no |
| <a name="input_s3_bucket_versioning"></a> [s3\_bucket\_versioning](#input\_s3\_bucket\_versioning) | Specifies whether bucket versioning will be enabled or not | `string` | `"Enabled"` | no |
| <a name="input_sns_topic_arn"></a> [sns\_topic\_arn](#input\_sns\_topic\_arn) | Specifies the SNS topic arn if bucket notification is enabled | `string` | `""` | no |
| <a name="input_target_prefix"></a> [target\_prefix](#input\_target\_prefix) | Specifies the target prefix for the logging bucket | `string` | `"log/"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_s3_bucket_arn"></a> [s3\_bucket\_arn](#output\_s3\_bucket\_arn) | Output of the S3 bucket arn to be used in other modules (if extended) |
| <a name="output_s3_bucket_endpoint"></a> [s3\_bucket\_endpoint](#output\_s3\_bucket\_endpoint) | Output of the S3 bucket name |
| <a name="output_s3_bucket_id"></a> [s3\_bucket\_id](#output\_s3\_bucket\_id) | Output of the s3 bucket id to be used in other modules (if extended) |
| <a name="output_s3_bucket_path"></a> [s3\_bucket\_path](#output\_s3\_bucket\_path) | Output of the S3 bucket path to be used in other modules (if extended) |
