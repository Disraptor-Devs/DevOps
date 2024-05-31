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
| [aws_ssm_parameter.secret](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ssm_parameter) | resource |
| [aws_ssm_parameter.getSecret](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ssm_parameter) | data source |
| [aws_ssm_parameters_by_path.getSecretByPath](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ssm_parameters_by_path) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_parameter_configs"></a> [parameter\_configs](#input\_parameter\_configs) | Specify the values that will be used to define the SSM parameter | <pre>map(object({<br>    description = string<br>    type        = string<br>    value       = string<br>  }))</pre> | n/a | yes |
| <a name="input_ssm_parameter_tags"></a> [ssm\_parameter\_tags](#input\_ssm\_parameter\_tags) | Specify the tags for the SSM Parameter being created | `map(string)` | n/a | yes |
| <a name="input_is_get_value"></a> [is\_get\_value](#input\_is\_get\_value) | Specify if we're dealing with an existing parameter and we just need to get the value | `bool` | `false` | no |
| <a name="input_is_get_value_by_path"></a> [is\_get\_value\_by\_path](#input\_is\_get\_value\_by\_path) | Specify if we're dealing with an existing parameter and we just need to get the value by path | `bool` | `false` | no |
| <a name="input_parameter_values_to_get_by_name"></a> [parameter\_values\_to\_get\_by\_name](#input\_parameter\_values\_to\_get\_by\_name) | Specifies the names we'll use to get the parameter value | `list(string)` | `[]` | no |
| <a name="input_parameter_values_to_get_by_path"></a> [parameter\_values\_to\_get\_by\_path](#input\_parameter\_values\_to\_get\_by\_path) | Specifies the paths we'll use to get the parameter value | `list(string)` | `[]` | no |
| <a name="input_region"></a> [region](#input\_region) | Specify Region in which the AWS resources will be deployed | `string` | `"af-south-1"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_ssm_paramater_arn"></a> [ssm\_paramater\_arn](#output\_ssm\_paramater\_arn) | Output the SSM Parameter arn |
| <a name="output_ssm_paramter_value"></a> [ssm\_paramter\_value](#output\_ssm\_paramter\_value) | Output the SSM parameter value for the sake of being imported by other modules |
| <a name="output_ssm_paramter_value_by_path"></a> [ssm\_paramter\_value\_by\_path](#output\_ssm\_paramter\_value\_by\_path) | Output the SSM parameter value by path provided |
