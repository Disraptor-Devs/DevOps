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
| [aws_s3_bucket.website_hosting](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket) | resource |
| [aws_s3_bucket_acl.bucket_acl](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_acl) | resource |
| [aws_s3_bucket_ownership_controls.ownership_controls](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_ownership_controls) | resource |
| [aws_s3_bucket_policy.website_bucket_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_policy) | resource |
| [aws_s3_bucket_public_access_block.s3_bucket_public_access_block](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_public_access_block) | resource |
| [aws_s3_bucket_website_configuration.website_config](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_website_configuration) | resource |
| [aws_iam_policy_document.s_bucket_hosting_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_bucket_name"></a> [bucket\_name](#input\_bucket\_name) | A unique name for the S3 bucket. This name must be globally unique and adhere to S3 bucket naming conventions. | `string` | n/a | yes |
| <a name="input_environment"></a> [environment](#input\_environment) | the environment that you are working in, i.e. 'staging' or 'prod' | `string` | n/a | yes |
| <a name="input_error_document"></a> [error\_document](#input\_error\_document) | The name of the error document to be served when a request results in an error (e.g., 404 Not Found). Default is 'error.html'. | `string` | `"error.html"` | no |
| <a name="input_index_document"></a> [index\_document](#input\_index\_document) | The name of the index document to be served when a request is made to the root of the bucket or to a folder. Default is 'index.html'. | `string` | `"index.html"` | no |
| <a name="input_region"></a> [region](#input\_region) | The AWS region where the infrastructure will be deployed. Default is 'af-south-1'. | `string` | `"af-south-1"` | no |
| <a name="input_tag_name"></a> [tag\_name](#input\_tag\_name) | A name for the 'Name' tag that will be applied to all resources. This helps in identifying and managing your resources. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_bucket_arn"></a> [bucket\_arn](#output\_bucket\_arn) | The ARN of the S3 bucket |
| <a name="output_bucket_domain_name"></a> [bucket\_domain\_name](#output\_bucket\_domain\_name) | The domain name of the S3 bucket |
| <a name="output_bucket_id"></a> [bucket\_id](#output\_bucket\_id) | The ID of the S3 bucket |
| <a name="output_bucket_name"></a> [bucket\_name](#output\_bucket\_name) | The name of the S3 bucket |
| <a name="output_bucket_policy"></a> [bucket\_policy](#output\_bucket\_policy) | The JSON representation of the S3 bucket policy |
| <a name="output_bucket_region"></a> [bucket\_region](#output\_bucket\_region) | The AWS region where the S3 bucket is created |
| <a name="output_bucket_website_endpoint"></a> [bucket\_website\_endpoint](#output\_bucket\_website\_endpoint) | The website endpoint of the S3 bucket |
| <a name="output_public_access_block"></a> [public\_access\_block](#output\_public\_access\_block) | Public access block configuration for the S3 bucket |
<!-- END_TF_DOCS -->