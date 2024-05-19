## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 2.70.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.50.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_security_group.security](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group_rule.egress](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_security_group_rule.ingress](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_sg_description"></a> [sg\_description](#input\_sg\_description) | Specifies the description of the security group | `string` | n/a | yes |
| <a name="input_sg_name"></a> [sg\_name](#input\_sg\_name) | Specifies the name of the security group | `string` | n/a | yes |
| <a name="input_sg_tags"></a> [sg\_tags](#input\_sg\_tags) | Specifies the tags (key, value pairs) to be associated with the security group | `map(string)` | n/a | yes |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | Specifies the VPC ID in which the security group will be created | `string` | n/a | yes |
| <a name="input_egress_rules"></a> [egress\_rules](#input\_egress\_rules) | Specifies the egress rules for the security group | <pre>map(object({<br>    from_port   = number<br>    to_port     = number<br>    protocol    = string<br>    cidr_blocks = list(string)<br>    description = string<br>  }))</pre> | `null` | no |
| <a name="input_ingress_rules"></a> [ingress\_rules](#input\_ingress\_rules) | Specifies the ingress rules for the security group | <pre>map(object({<br>    from_port   = number<br>    to_port     = number<br>    protocol    = string<br>    cidr_blocks = list(string)<br>    description = string<br>  }))</pre> | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_sg_arn"></a> [sg\_arn](#output\_sg\_arn) | The name of the security group |
| <a name="output_sg_id"></a> [sg\_id](#output\_sg\_id) | The ID of the security group |
| <a name="output_sg_name"></a> [sg\_name](#output\_sg\_name) | The name of the security group |
| <a name="output_sg_vpc_id"></a> [sg\_vpc\_id](#output\_sg\_vpc\_id) | The VPC ID of the security group |
