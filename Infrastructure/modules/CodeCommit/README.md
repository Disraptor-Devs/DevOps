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
| [aws_codecommit_repository.name](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/codecommit_repository) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_code_commit_repository_name"></a> [code\_commit\_repository\_name](#input\_code\_commit\_repository\_name) | The name of the CodeCommit repository | `string` | n/a | yes |
| <a name="input_dynamodb_lock_table"></a> [dynamodb\_lock\_table](#input\_dynamodb\_lock\_table) | The name of the DynamoDB table to use for Terraform state locking | `string` | n/a | yes |
| <a name="input_terraform_state_key"></a> [terraform\_state\_key](#input\_terraform\_state\_key) | The path to the Terraform state file in the S3 bucket | `string` | n/a | yes |
| <a name="input_backend_bucket"></a> [backend\_bucket](#input\_backend\_bucket) | The name of the S3 bucket to store the Terraform state file | `string` | `"disraptor-terraform-state"` | no |
| <a name="input_region"></a> [region](#input\_region) | The region in which the resources will be created | `string` | `"af-south-1"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_repository_arn"></a> [repository\_arn](#output\_repository\_arn) | Code commit repository branch name |
| <a name="output_repository_id"></a> [repository\_id](#output\_repository\_id) | Code commit repository name |
