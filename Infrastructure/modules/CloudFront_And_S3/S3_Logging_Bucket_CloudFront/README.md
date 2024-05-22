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
| [aws_s3_bucket.cloudwatch_logs_bucket](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket) | resource |
| [aws_s3_bucket_acl.bucket_acl](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_acl) | resource |
| [aws_s3_bucket_ownership_controls.bucket_ownership](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_ownership_controls) | resource |
| [aws_s3_bucket_policy.bucket_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_policy) | resource |
| [aws_iam_policy_document.cf_bucket_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cloudFront_logging_bucket_name"></a> [cloudFront\_logging\_bucket\_name](#input\_cloudFront\_logging\_bucket\_name) | A unique name for the S3 bucket. This name must be globally unique and adhere to S3 bucket naming conventions. | `string` | n/a | yes |
| <a name="input_environment"></a> [environment](#input\_environment) | the environment that you are working in, i.e. 'staging' or 'prod' | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | The AWS region where the infrastructure will be deployed. Default is 'af-south-1'. | `string` | `"af-south-1"` | no |
| <a name="input_tag_name"></a> [tag\_name](#input\_tag\_name) | A name for the 'Name' tag that will be applied to all resources. This helps in identifying and managing your resources. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_bucket_arn"></a> [bucket\_arn](#output\_bucket\_arn) | The Amazon Resource Name (ARN) of the S3 bucket used for CloudFront logging |
| <a name="output_bucket_id"></a> [bucket\_id](#output\_bucket\_id) | The ID of the S3 bucket used for CloudFront logging |
| <a name="output_bucket_name"></a> [bucket\_name](#output\_bucket\_name) | The name of the S3 bucket used for CloudFront logging |
| <a name="output_s3_cloudfront_logging_bucket"></a> [s3\_cloudfront\_logging\_bucket](#output\_s3\_cloudfront\_logging\_bucket) | The endpoint for the S3 bucket used for CloudFront logging, formatted as bucket-name.s3.amazonaws.com |
<!-- END_TF_DOCS -->