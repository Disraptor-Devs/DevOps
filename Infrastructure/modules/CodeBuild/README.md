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
| [aws_codebuild_project.code_build](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/codebuild_project) | resource |
| [aws_iam_role.code_build_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachement.s3_access](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachement) | resource |
| [aws_iam_role_policy_attachment.lambda_access](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.logs_access](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_policy_document.assume_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_buildspec_path"></a> [buildspec\_path](#input\_buildspec\_path) | The path to the buildspec file | `string` | n/a | yes |
| <a name="input_code_build_project_name"></a> [code\_build\_project\_name](#input\_code\_build\_project\_name) | The name of the CodeBuild project | `string` | n/a | yes |
| <a name="input_code_build_tags"></a> [code\_build\_tags](#input\_code\_build\_tags) | The tags to apply to the CodeBuild project | `map(string)` | n/a | yes |
| <a name="input_codebuild_iam_role_name"></a> [codebuild\_iam\_role\_name](#input\_codebuild\_iam\_role\_name) | The name of the IAM role to create for the CodeBuild project | `string` | n/a | yes |
| <a name="input_dynamodb_lock_table"></a> [dynamodb\_lock\_table](#input\_dynamodb\_lock\_table) | The name of the DynamoDB table to use for Terraform state locking | `string` | n/a | yes |
| <a name="input_terraform_state_key"></a> [terraform\_state\_key](#input\_terraform\_state\_key) | The path to the Terraform state file in the S3 bucket | `string` | n/a | yes |
| <a name="input_backend_bucket"></a> [backend\_bucket](#input\_backend\_bucket) | The name of the S3 bucket to store the Terraform state file | `string` | `"disraptor-terraform-state"` | no |
| <a name="input_code_build_artifact_type"></a> [code\_build\_artifact\_type](#input\_code\_build\_artifact\_type) | The type of artifact to produce | `string` | `"NO_ARTIFACTS"` | no |
| <a name="input_region"></a> [region](#input\_region) | The region in which the resources will be created | `string` | `"af-south-1"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_code_build_id"></a> [code\_build\_id](#output\_code\_build\_id) | Code build id |
| <a name="output_code_build_project_name"></a> [code\_build\_project\_name](#output\_code\_build\_project\_name) | Code build project name |
| <a name="output_code_build_role_arn"></a> [code\_build\_role\_arn](#output\_code\_build\_role\_arn) | Code build role arn |

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 2.70.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.39.1 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_codebuild_project.code_build](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/codebuild_project) | resource |
| [aws_iam_role.code_build_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.lf_access](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_policy_document.assume_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_artifact_name"></a> [artifact\_name](#input\_artifact\_name) | The name of the build artifact | `string` | n/a | yes |
| <a name="input_code_build_artifact_type"></a> [code\_build\_artifact\_type](#input\_code\_build\_artifact\_type) | The type of artifact to produce | `string` | `"NO_ARTIFACTS"` | no |
| <a name="input_code_build_project_name"></a> [code\_build\_project\_name](#input\_code\_build\_project\_name) | The name of the CodeBuild project | `string` | n/a | yes |
| <a name="input_code_build_tags"></a> [code\_build\_tags](#input\_code\_build\_tags) | The tags to apply to the CodeBuild project | `map(string)` | n/a | yes |
| <a name="input_codebuild_iam_role_name"></a> [codebuild\_iam\_role\_name](#input\_codebuild\_iam\_role\_name) | The name of the IAM role to create for the CodeBuild project | `string` | n/a | yes |
| <a name="input_environment"></a> [environment](#input\_environment) | The environment CodeBuild runs for | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | The region in which the resources will be created | `string` | `"eu-central-1"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_code_build_id"></a> [code\_build\_id](#output\_code\_build\_id) | Code build id |
| <a name="output_code_build_project_name"></a> [code\_build\_project\_name](#output\_code\_build\_project\_name) | Code build project name |
| <a name="output_code_build_role_arn"></a> [code\_build\_role\_arn](#output\_code\_build\_role\_arn) | Code build role arn |
<!-- END_TF_DOCS -->