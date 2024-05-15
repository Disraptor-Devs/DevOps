## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 2.70.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.25.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_kms_key.bucket_kms_key](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_key) | resource |
| [aws_s3_access_point.access_point](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_access_point) | resource |
| [aws_s3_bucket.logging_bucket](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket) | resource |
| [aws_s3_bucket.s3_bucket](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket) | resource |
| [aws_s3_bucket_acl.aws_s3_bucket_acl](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_acl) | resource |
| [aws_s3_bucket_acl.log_bucket_acl](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_acl) | resource |
| [aws_s3_bucket_lifecycle_configuration.s3_lifecycle](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_lifecycle_configuration) | resource |
| [aws_s3_bucket_logging.bucket_logging](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_logging) | resource |
| [aws_s3_bucket_notification.bucket_notification](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_notification) | resource |
| [aws_s3_bucket_ownership_controls.owner](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_ownership_controls) | resource |
| [aws_s3_bucket_policy.bucket_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_policy) | resource |
| [aws_s3_bucket_public_access_block.s3_public_access](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_public_access_block) | resource |
| [aws_s3_bucket_server_side_encryption_configuration.s3_bucket_encryption](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_server_side_encryption_configuration) | resource |
| [aws_s3_bucket_versioning.versioning](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_versioning) | resource |
| [aws_s3_bucket_website_configuration.s3_hosted_site](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_website_configuration) | resource |
| [aws_iam_policy_document.bucket_policy_doc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_s3_bucket_name"></a> [s3\_bucket\_name](#input\_s3\_bucket\_name) | Specifies the name of the bucket being created | `string` | n/a | yes |
| <a name="input_s3_policy_actions"></a> [s3\_policy\_actions](#input\_s3\_policy\_actions) | Specify a list of actions to attach to the s3 bucket policy | `set(string)` | n/a | yes |
| <a name="input_s3_tags"></a> [s3\_tags](#input\_s3\_tags) | Specify the tags (key, value pairs) to be associated with the S3 bucket | `map(string)` | n/a | yes |
| <a name="input_is_access_point"></a> [is\_access\_point](#input\_is\_access\_point) | Specify whether we need to create an access point for our S3 bucket | `bool` | `false` | no |
| <a name="input_is_block_public_acls"></a> [is\_block\_public\_acls](#input\_is\_block\_public\_acls) | Specifies whether to block public ACLs for the S3 bucket | `bool` | `false` | no |
| <a name="input_is_block_public_policy"></a> [is\_block\_public\_policy](#input\_is\_block\_public\_policy) | Specifies whether to block public policies for the S3 bucket | `bool` | `false` | no |
| <a name="input_is_bucket_notification"></a> [is\_bucket\_notification](#input\_is\_bucket\_notification) | Specify whether we enable bucket notification | `bool` | `false` | no |
| <a name="input_is_ignore_public_acls"></a> [is\_ignore\_public\_acls](#input\_is\_ignore\_public\_acls) | Specifies whether to ignore public ACLs for the S3 bucket | `bool` | `false` | no |
| <a name="input_is_kms_encryption"></a> [is\_kms\_encryption](#input\_is\_kms\_encryption) | Specify whether to enable KMS encryption for the S3 bucket | `bool` | `false` | no |
| <a name="input_is_lifecycle_policy"></a> [is\_lifecycle\_policy](#input\_is\_lifecycle\_policy) | Specify whether to create and attach a lifecycle policy to the S3 bucket | `bool` | `false` | no |
| <a name="input_is_logging_bucket"></a> [is\_logging\_bucket](#input\_is\_logging\_bucket) | Specifies whether we need to create a logging bucket for the main bucket being created | `bool` | `false` | no |
| <a name="input_is_public_access_block"></a> [is\_public\_access\_block](#input\_is\_public\_access\_block) | Specifies whether to block public access for the S3 bucket | `bool` | `false` | no |
| <a name="input_is_restrict_public_buckets"></a> [is\_restrict\_public\_buckets](#input\_is\_restrict\_public\_buckets) | Specifies whether to restrict public buckets for the S3 bucket | `bool` | `false` | no |
| <a name="input_is_s3_routing_rules"></a> [is\_s3\_routing\_rules](#input\_is\_s3\_routing\_rules) | Specifies whether to enable routing rules for the S3 static website hosting | `bool` | `false` | no |
| <a name="input_is_s3_site_hosting"></a> [is\_s3\_site\_hosting](#input\_is\_s3\_site\_hosting) | Specifies whether to enable S3 static website hosting | `bool` | `false` | no |
| <a name="input_lifecycle_name"></a> [lifecycle\_name](#input\_lifecycle\_name) | Specify name for the lifecycle config for the S3 bucket | `string` | `null` | no |
| <a name="input_lifecycle_storage_class"></a> [lifecycle\_storage\_class](#input\_lifecycle\_storage\_class) | Specify the storage class to transition to | `map(string)` | `{}` | no |
| <a name="input_lifecycle_transition_days"></a> [lifecycle\_transition\_days](#input\_lifecycle\_transition\_days) | Specify the number of days to transition the bucket to a different class | `number` | `0` | no |
| <a name="input_lifecylce_status"></a> [lifecylce\_status](#input\_lifecylce\_status) | Specify the status of the lifecycle | `string` | `"Disabled"` | no |
| <a name="input_object_ownership"></a> [object\_ownership](#input\_object\_ownership) | Specify the Object ownership for the S3 being created | `string` | `"ObjectWriter"` | no |
| <a name="input_object_path"></a> [object\_path](#input\_object\_path) | Specify the path to the object | `string` | `null` | no |
| <a name="input_region"></a> [region](#input\_region) | Specfies the region in which this resouce will be created in | `string` | `"af-south-1"` | no |
| <a name="input_s3_bucket_acl"></a> [s3\_bucket\_acl](#input\_s3\_bucket\_acl) | Specifies whether the s3 bucket will be private or public-facing | `string` | `"private"` | no |
| <a name="input_s3_bucket_notification_events"></a> [s3\_bucket\_notification\_events](#input\_s3\_bucket\_notification\_events) | Specifies the events we want to be notified off on the created S3 bucket | `set(string)` | `[]` | no |
| <a name="input_s3_bucket_versioning"></a> [s3\_bucket\_versioning](#input\_s3\_bucket\_versioning) | Specifies whether bucket versioning will be enabled or not | `string` | `"Enabled"` | no |
| <a name="input_s3_error_document"></a> [s3\_error\_document](#input\_s3\_error\_document) | Specifies the error document for the S3 static website hosting | `string` | `null` | no |
| <a name="input_s3_identifiers"></a> [s3\_identifiers](#input\_s3\_identifiers) | Specifies the identifiers for the S3 bucket being created | `set(string)` | <pre>[<br>  "*"<br>]</pre> | no |
| <a name="input_s3_index_document"></a> [s3\_index\_document](#input\_s3\_index\_document) | Specifies the index document for the S3 static website hosting | `string` | `"index.html"` | no |
| <a name="input_s3_routing_key_prefix_condition"></a> [s3\_routing\_key\_prefix\_condition](#input\_s3\_routing\_key\_prefix\_condition) | Specifies the key prefix condition for the routing rule | `string` | `null` | no |
| <a name="input_s3_routing_replace_key_prefix_with"></a> [s3\_routing\_replace\_key\_prefix\_with](#input\_s3\_routing\_replace\_key\_prefix\_with) | Specifies the key prefix to replace with | `string` | `null` | no |
| <a name="input_s3_site_hostname"></a> [s3\_site\_hostname](#input\_s3\_site\_hostname) | Specifies the hostname for the S3 static website hosting | `string` | `null` | no |
| <a name="input_s3_site_protocol"></a> [s3\_site\_protocol](#input\_s3\_site\_protocol) | Specifies the protocol for the S3 static website hosting | `string` | `"https"` | no |
| <a name="input_sns_topic_arn"></a> [sns\_topic\_arn](#input\_sns\_topic\_arn) | Specifies the SNS topic arn if bucket notification is enabled | `string` | `null` | no |
| <a name="input_target_prefix"></a> [target\_prefix](#input\_target\_prefix) | Specifies the target prefix for the logging bucket | `string` | `"log/"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_s3_bucket_arn"></a> [s3\_bucket\_arn](#output\_s3\_bucket\_arn) | Output of the S3 bucket arn to be used in other modules (if extended) |
| <a name="output_s3_bucket_id"></a> [s3\_bucket\_id](#output\_s3\_bucket\_id) | Output of the s3 bucket id to be used in other modules (if extended) |
| <a name="output_s3_bucket_path"></a> [s3\_bucket\_path](#output\_s3\_bucket\_path) | Output of the S3 bucket path to be used in other modules (if extended) |
| <a name="output_s3_bucket_url"></a> [s3\_bucket\_url](#output\_s3\_bucket\_url) | Output of the S3 bucket region-specific URL |
