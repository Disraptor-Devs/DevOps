## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_codedeploy_app.code_deploy_app](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/codedeploy_app) | resource |
| [aws_codedeploy_deployment_config.deployment_config](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/codedeploy_deployment_config) | resource |
| [aws_codedeploy_deployment_group.deployment_group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/codedeploy_deployment_group) | resource |
| [aws_sns_topic.sns_topic](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/sns_topic) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_code_deploy_app_name"></a> [code\_deploy\_app\_name](#input\_code\_deploy\_app\_name) | The name of the CodeDeploy application | `string` | n/a | yes |
| <a name="input_deployment_config_name"></a> [deployment\_config\_name](#input\_deployment\_config\_name) | The name of the deployment configuration | `string` | n/a | yes |
| <a name="input_deployment_group_name"></a> [deployment\_group\_name](#input\_deployment\_group\_name) | The name of the deployment group | `string` | n/a | yes |
| <a name="input_deployment_tags"></a> [deployment\_tags](#input\_deployment\_tags) | The tags to apply to the deployment group | `map(string)` | n/a | yes |
| <a name="input_dynamodb_lock_table"></a> [dynamodb\_lock\_table](#input\_dynamodb\_lock\_table) | The name of the DynamoDB table to use for Terraform state locking | `string` | n/a | yes |
| <a name="input_sns_topic_name"></a> [sns\_topic\_name](#input\_sns\_topic\_name) | The name of the SNS topic | `string` | n/a | yes |
| <a name="input_terraform_state_key"></a> [terraform\_state\_key](#input\_terraform\_state\_key) | The path to the Terraform state file in the S3 bucket | `string` | n/a | yes |
| <a name="input_trigger_name"></a> [trigger\_name](#input\_trigger\_name) | The name of the trigger | `string` | n/a | yes |
| <a name="input_backend_bucket"></a> [backend\_bucket](#input\_backend\_bucket) | The name of the S3 bucket to store the Terraform state file | `string` | `"disraptor-terraform-state"` | no |
| <a name="input_region"></a> [region](#input\_region) | The region in which the resources will be created | `string` | `"af-south-1"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_code_deplo_app_id"></a> [code\_deplo\_app\_id](#output\_code\_deplo\_app\_id) | Code deploy app id |
| <a name="output_code_deploy_app_arn"></a> [code\_deploy\_app\_arn](#output\_code\_deploy\_app\_arn) | Code deploy app arn |
| <a name="output_code_deploy_app_name"></a> [code\_deploy\_app\_name](#output\_code\_deploy\_app\_name) | Code deploy app name |
| <a name="output_deployment_group_arn"></a> [deployment\_group\_arn](#output\_deployment\_group\_arn) | Deployment group arn |
| <a name="output_deployment_group_id"></a> [deployment\_group\_id](#output\_deployment\_group\_id) | Deployment group id |
| <a name="output_deployment_group_name"></a> [deployment\_group\_name](#output\_deployment\_group\_name) | Deployment group name |
