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
| [aws_iam_policy.sf_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_role.step_function_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.policy_sf_attach](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_sfn_state_machine.state_machine](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sfn_state_machine) | resource |
| [aws_iam_policy_document.policy_attachments](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.sf_assume_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_environment"></a> [environment](#input\_environment) | The environment where the infrastructure is deployed, such as 'staging' or 'prod'. This helps in managing resources based on their lifecycle stage. | `string` | n/a | yes |
| <a name="input_policy_name"></a> [policy\_name](#input\_policy\_name) | The name to assign to the IAM Policy that will be created. This policy includes all necessary permissions for the Step Function. | `string` | n/a | yes |
| <a name="input_policy_statements"></a> [policy\_statements](#input\_policy\_statements) | A list of policy statements to attach to the IAM Role. Each statement contains a list of actions and resources that define the permissions for the role. | <pre>list(object({<br>    actions   = list(string)<br>    resources = list(string)<br>  }))</pre> | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | The AWS region where the infrastructure will be deployed. Default is 'af-south-1'. | `string` | `"af-south-1"` | no |
| <a name="input_step_func_code_definition"></a> [step\_func\_code\_definition](#input\_step\_func\_code\_definition) | The JSON-encoded definition of the Step Function state machine. This defines the states, transitions, and tasks that make up the Step Function's workflow. | `string` | n/a | yes |
| <a name="input_step_function_name"></a> [step\_function\_name](#input\_step\_function\_name) | The name to assign to the Step Function. This name is used to identify and manage the Step Function within AWS. | `string` | n/a | yes |
| <a name="input_step_function_role_name"></a> [step\_function\_role\_name](#input\_step\_function\_role\_name) | The name to assign to the IAM Role that will be used by the Step Function. This role allows the Step Function to interact with other AWS services. | `string` | n/a | yes |
| <a name="input_tag_name"></a> [tag\_name](#input\_tag\_name) | A name for the 'Name' tag that will be applied to all resources. This helps in identifying and managing your resources across AWS services. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_iam_policy_arn"></a> [iam\_policy\_arn](#output\_iam\_policy\_arn) | The ARN of the IAM policy created for Step Functions |
| <a name="output_iam_policy_id"></a> [iam\_policy\_id](#output\_iam\_policy\_id) | The ID of the IAM policy created for Step Functions |
| <a name="output_iam_policy_name"></a> [iam\_policy\_name](#output\_iam\_policy\_name) | The name of the IAM policy created for Step Functions |
| <a name="output_iam_role_arn"></a> [iam\_role\_arn](#output\_iam\_role\_arn) | The ARN of the IAM role created for Step Functions |
| <a name="output_iam_role_id"></a> [iam\_role\_id](#output\_iam\_role\_id) | The ID of the IAM role created for Step Functions |
| <a name="output_iam_role_name"></a> [iam\_role\_name](#output\_iam\_role\_name) | The name of the IAM role created for Step Functions |
| <a name="output_role_policy_attachment_policy_arn"></a> [role\_policy\_attachment\_policy\_arn](#output\_role\_policy\_attachment\_policy\_arn) | The ARN of the policy attached to the IAM role |
| <a name="output_role_policy_attachment_role"></a> [role\_policy\_attachment\_role](#output\_role\_policy\_attachment\_role) | The name of the IAM role to which the policy is attached |
| <a name="output_state_machine_arn"></a> [state\_machine\_arn](#output\_state\_machine\_arn) | The ARN of the Step Function state machine |
| <a name="output_state_machine_id"></a> [state\_machine\_id](#output\_state\_machine\_id) | The ID of the Step Function state machine |
| <a name="output_state_machine_name"></a> [state\_machine\_name](#output\_state\_machine\_name) | The name of the Step Function state machine |
<!-- END_TF_DOCS -->