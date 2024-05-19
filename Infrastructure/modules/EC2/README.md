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
| [aws_iam_role.ec2_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_instance.ec2_instance](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance) | resource |
| [aws_ami.found_ami](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ami) | data source |
| [aws_iam_policy_document.assume_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.inline_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_subnets.existing_subnets](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/subnets) | data source |
| [aws_vpc.existing_vpc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/vpc) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_ec2_instance_name"></a> [ec2\_instance\_name](#input\_ec2\_instance\_name) | Specifies the name of the EC2 instance | `string` | n/a | yes |
| <a name="input_ec2_role_name"></a> [ec2\_role\_name](#input\_ec2\_role\_name) | Specifies the name of the IAM role to be attached to the EC2 instance | `string` | n/a | yes |
| <a name="input_ec2_tags"></a> [ec2\_tags](#input\_ec2\_tags) | Specify the tags (key, value pairs) to be associated with the EC2 instance | `map(string)` | n/a | yes |
| <a name="input_key_pair_name"></a> [key\_pair\_name](#input\_key\_pair\_name) | Specifies the name of the key pair to be attached to the EC2 instance | `string` | n/a | yes |
| <a name="input_security_group_ids"></a> [security\_group\_ids](#input\_security\_group\_ids) | Specifies the security group IDs to be attached to the EC2 instance | `set(string)` | n/a | yes |
| <a name="input_user_data_base64"></a> [user\_data\_base64](#input\_user\_data\_base64) | Specifies the user data to be executed on the EC2 instance | `string` | n/a | yes |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | Specifies the VPC ID in which the security group will be created | `string` | n/a | yes |
| <a name="input_ami_filters"></a> [ami\_filters](#input\_ami\_filters) | Specifies the filters to be applied to the AMI search | `map(string)` | `{}` | no |
| <a name="input_ami_owners"></a> [ami\_owners](#input\_ami\_owners) | Specifies the owners of the AMI | `list(string)` | <pre>[<br>  "AWS"<br>]</pre> | no |
| <a name="input_ec2_root_volume_size"></a> [ec2\_root\_volume\_size](#input\_ec2\_root\_volume\_size) | Specifies the size of the root volume of the EC2 instance | `number` | `8` | no |
| <a name="input_ec2_volume_type"></a> [ec2\_volume\_type](#input\_ec2\_volume\_type) | Specifies the type of the volume to be attached to the EC2 instance | `string` | `"gp2"` | no |
| <a name="input_instance_type"></a> [instance\_type](#input\_instance\_type) | Specifies the type of the EC2 instance | `string` | `"t3.nano"` | no |
| <a name="input_is_existing_vpc"></a> [is\_existing\_vpc](#input\_is\_existing\_vpc) | Specifies whether the VPC is existing or not | `bool` | `false` | no |
| <a name="input_monitoring_enabled"></a> [monitoring\_enabled](#input\_monitoring\_enabled) | Specifies whether detailed monitoring is enabled for the EC2 instance | `bool` | `true` | no |
| <a name="input_region"></a> [region](#input\_region) | Specfies the region in which this resouce will be created in | `string` | `"af-south-1"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_ec2_ami"></a> [ec2\_ami](#output\_ec2\_ami) | The VPC ID of the EC2 instance |
| <a name="output_ec2_arn"></a> [ec2\_arn](#output\_ec2\_arn) | The ARN of the EC2 instance |
| <a name="output_ec2_instance_id"></a> [ec2\_instance\_id](#output\_ec2\_instance\_id) | The ID of the EC2 instance |
