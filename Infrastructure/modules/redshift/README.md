## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 5.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 5.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_iam_role.iamrole](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.redshift_event_bridge_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.redshift_glue_service_role_Attachement](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.redshift_lambda_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.redshift_s3_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_kms_key.kms_key](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_key) | resource |
| [aws_redshift_cluster.redshift](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/redshift_cluster) | resource |
| [aws_iam_policy_document.redshift_iamrole_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_redshift_iam_role_name"></a> [redshift\_iam\_role\_name](#input\_redshift\_iam\_role\_name) | The name of the IAM role for MSK. | `string` | n/a | yes |
| <a name="input_automated_snapshot_retention_period"></a> [automated\_snapshot\_retention\_period](#input\_automated\_snapshot\_retention\_period) | The number of days to wait before delete the snapshot | `number` | `1` | no |
| <a name="input_cluster_identifier"></a> [cluster\_identifier](#input\_cluster\_identifier) | The unique identifier of the Redshift cluster. | `string` | `null` | no |
| <a name="input_cluster_subnet_group_name"></a> [cluster\_subnet\_group\_name](#input\_cluster\_subnet\_group\_name) | The subnet groups you want to associate withe the Redshift cluster | `string` | `null` | no |
| <a name="input_cluster_type"></a> [cluster\_type](#input\_cluster\_type) | The cluster type | `string` | `"single-node"` | no |
| <a name="input_database_name"></a> [database\_name](#input\_database\_name) | The name of the default database to be created when the cluster is launched. | `string` | `null` | no |
| <a name="input_iam_roles"></a> [iam\_roles](#input\_iam\_roles) | The IAM roles to associate with this cluster | `list(string)` | `[]` | no |
| <a name="input_master_password"></a> [master\_password](#input\_master\_password) | The database Password | `string` | `null` | no |
| <a name="input_master_username"></a> [master\_username](#input\_master\_username) | The database user name | `string` | `"admin"` | no |
| <a name="input_node_type"></a> [node\_type](#input\_node\_type) | The node type | `string` | `"dc2.large"` | no |
| <a name="input_number_of_nodes"></a> [number\_of\_nodes](#input\_number\_of\_nodes) | The number of node | `number` | `1` | no |
| <a name="input_port"></a> [port](#input\_port) | The port number on which the Redshift cluster accepts connections. | `number` | `5439` | no |
| <a name="input_publicly_accessible"></a> [publicly\_accessible](#input\_publicly\_accessible) | Should the redshift  cluster be accessble outside the vpc | `bool` | `false` | no |
| <a name="input_snapshot_cluster_identifier"></a> [snapshot\_cluster\_identifier](#input\_snapshot\_cluster\_identifier) | The snapshot name | `string` | `null` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | The tags name | `map(string)` | `null` | no |
| <a name="input_vpc_security_group_ids"></a> [vpc\_security\_group\_ids](#input\_vpc\_security\_group\_ids) | The vpc you want to assoiate the the cluster with | `list(string)` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_redshift_cluster_arn"></a> [redshift\_cluster\_arn](#output\_redshift\_cluster\_arn) | The arn for the Redshift cluster |
| <a name="output_redshift_database"></a> [redshift\_database](#output\_redshift\_database) | The database for the Redshift cluster |
| <a name="output_redshift_master_password"></a> [redshift\_master\_password](#output\_redshift\_master\_password) | The master password for the Redshift cluster |
| <a name="output_redshift_master_username"></a> [redshift\_master\_username](#output\_redshift\_master\_username) | The master username for the Redshift cluster |
