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
| [aws_codepipeline.code_pipeline](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/codepipeline) | resource |
| [aws_iam_role.codepipeline_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_policy_document.assume_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.code_pipeline_doc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_code_build_project_name"></a> [code\_build\_project\_name](#input\_code\_build\_project\_name) | The name of the CodeBuild project | `string` | n/a | yes |
| <a name="input_code_commit_branch_name"></a> [code\_commit\_branch\_name](#input\_code\_commit\_branch\_name) | The name of the CodeCommit branch | `string` | n/a | yes |
| <a name="input_code_commit_repository_name"></a> [code\_commit\_repository\_name](#input\_code\_commit\_repository\_name) | The name of the CodeCommit repository | `string` | n/a | yes |
| <a name="input_code_pipeline_actions"></a> [code\_pipeline\_actions](#input\_code\_pipeline\_actions) | The actions to be performed by the CodePipeline | `set(string)` | n/a | yes |
| <a name="input_code_pipeline_artifact_store_bucket"></a> [code\_pipeline\_artifact\_store\_bucket](#input\_code\_pipeline\_artifact\_store\_bucket) | The name of the S3 bucket to store the CodePipeline artifacts | `string` | n/a | yes |
| <a name="input_code_pipeline_name"></a> [code\_pipeline\_name](#input\_code\_pipeline\_name) | The name of the CodePipeline | `string` | n/a | yes |
| <a name="input_code_pipeline_role_name"></a> [code\_pipeline\_role\_name](#input\_code\_pipeline\_role\_name) | The name of the IAM role to create for the CodePipeline | `string` | n/a | yes |
| <a name="input_code_pipeline_tags"></a> [code\_pipeline\_tags](#input\_code\_pipeline\_tags) | The tags to apply to the CodeBuild project | `map(string)` | n/a | yes |
| <a name="input_environment"></a> [environment](#input\_environment) | The environment CodeBuild runs for | `string` | n/a | yes |
| <a name="input_code_pipeline_artifact_store"></a> [code\_pipeline\_artifact\_store](#input\_code\_pipeline\_artifact\_store) | The type of artifact store to use | `string` | `"S3"` | no |
| <a name="input_region"></a> [region](#input\_region) | The region in which the resources will be created | `string` | `"eu-central-1"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_pipeline_id"></a> [pipeline\_id](#output\_pipeline\_id) | Code pipeline id |
| <a name="output_pipeline_name"></a> [pipeline\_name](#output\_pipeline\_name) | Code pipeline name |
| <a name="output_pipleine_arn"></a> [pipleine\_arn](#output\_pipleine\_arn) | Code pipeline arn |
