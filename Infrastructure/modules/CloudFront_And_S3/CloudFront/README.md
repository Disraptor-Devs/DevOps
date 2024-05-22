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
| [aws_cloudfront_distribution.cdn](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudfront_distribution) | resource |
| [aws_cloudfront_origin_access_control.aws_cloudfront_origin_access_control](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudfront_origin_access_control) | resource |
| [aws_s3_bucket.website_bucket](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/s3_bucket) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cloudfront_access_control_description"></a> [cloudfront\_access\_control\_description](#input\_cloudfront\_access\_control\_description) | The description of the CloudFront Origin Access Control. Defaults to 'This is used to log the website into the S3 bucket which is enabled for logging' if omitted. | `string` | `"This is used to log the website into the S3 bucket which is enabled for logging"` | no |
| <a name="input_cloudfront_access_control_name"></a> [cloudfront\_access\_control\_name](#input\_cloudfront\_access\_control\_name) | A unique name that identifies the CloudFront Origin Access Control. | `string` | n/a | yes |
| <a name="input_environment"></a> [environment](#input\_environment) | The environment where the infrastructure is deployed, such as 'staging' or 'prod'. | `string` | n/a | yes |
| <a name="input_prefix_value"></a> [prefix\_value](#input\_prefix\_value) | Prefix value for CloudFront logging to help organize logs within the logging bucket. Do not include a trailing '/'. The default prefix is 'cloudfront-logging'. | `string` | `"cloudfront-logging"` | no |
| <a name="input_region"></a> [region](#input\_region) | The AWS region where the infrastructure will be deployed. The default region is 'af-south-1'. | `string` | `"af-south-1"` | no |
| <a name="input_s3_cloudfront_logging_bucket"></a> [s3\_cloudfront\_logging\_bucket](#input\_s3\_cloudfront\_logging\_bucket) | The S3 bucket used for logging CloudFront access logs. It should be formatted as 'bucket-name.s3.amazonaws.com'. | `string` | n/a | yes |
| <a name="input_tag_name"></a> [tag\_name](#input\_tag\_name) | A name for the 'Name' tag that will be applied to all resources. This helps in identifying and managing your resources. | `string` | n/a | yes |
| <a name="input_website_bucket"></a> [website\_bucket](#input\_website\_bucket) | The name of the S3 bucket that will host the website content. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cloudfront_distribution_arn"></a> [cloudfront\_distribution\_arn](#output\_cloudfront\_distribution\_arn) | The ARN of the CloudFront distribution |
| <a name="output_cloudfront_distribution_domain_name"></a> [cloudfront\_distribution\_domain\_name](#output\_cloudfront\_distribution\_domain\_name) | The domain name of the CloudFront distribution |
| <a name="output_cloudfront_distribution_id"></a> [cloudfront\_distribution\_id](#output\_cloudfront\_distribution\_id) | The ID of the CloudFront distribution |
| <a name="output_cloudfront_distribution_status"></a> [cloudfront\_distribution\_status](#output\_cloudfront\_distribution\_status) | The status of the CloudFront distribution |
| <a name="output_cloudfront_origin_access_control_id"></a> [cloudfront\_origin\_access\_control\_id](#output\_cloudfront\_origin\_access\_control\_id) | The ID of the CloudFront origin access control |
| <a name="output_cloudfront_origin_access_control_name"></a> [cloudfront\_origin\_access\_control\_name](#output\_cloudfront\_origin\_access\_control\_name) | The name of the CloudFront origin access control |
| <a name="output_s3_bucket_regional_domain_name"></a> [s3\_bucket\_regional\_domain\_name](#output\_s3\_bucket\_regional\_domain\_name) | The regional domain name of the S3 bucket used as the origin for CloudFront |
| <a name="output_s3_origin_id"></a> [s3\_origin\_id](#output\_s3\_origin\_id) | The ID of the S3 origin for the CloudFront distribution |
<!-- END_TF_DOCS -->