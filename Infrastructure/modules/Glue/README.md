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
| [aws_glue_catalog_database.catalog_db](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/glue_catalog_database) | resource |
| [aws_glue_catalog_table.catalog_table](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/glue_catalog_table) | resource |
| [aws_glue_connection.glue_connect](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/glue_connection) | resource |
| [aws_glue_crawler.glue_crawler](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/glue_crawler) | resource |
| [aws_glue_dev_endpoint.dev_endpoint](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/glue_dev_endpoint) | resource |
| [aws_iam_role.iamrole](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.glue_glueServiceRole_Attachement](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_policy_document.glue_iamrole](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_glue_catalog_db_name"></a> [glue\_catalog\_db\_name](#input\_glue\_catalog\_db\_name) | Specify the name of the Glue Catalog DB | `string` | n/a | yes |
| <a name="input_glue_crawler_name"></a> [glue\_crawler\_name](#input\_glue\_crawler\_name) | Specify the name of the Glue Crawler | `string` | n/a | yes |
| <a name="input_glue_iam_role_name"></a> [glue\_iam\_role\_name](#input\_glue\_iam\_role\_name) | Specify the name of the iam role created for Glue | `string` | n/a | yes |
| <a name="input_glue_table_name"></a> [glue\_table\_name](#input\_glue\_table\_name) | Specify the name for the glue table being created | `string` | n/a | yes |
| <a name="input_glue_tags"></a> [glue\_tags](#input\_glue\_tags) | Specify tags for Glue resources (Key,Value pairs) | `map(string)` | n/a | yes |
| <a name="input_crawler_cron_schedule"></a> [crawler\_cron\_schedule](#input\_crawler\_cron\_schedule) | Specify the CRON schedule for the Glue crawler | `string` | `"cron(0 7 * * *)"` | no |
| <a name="input_crawler_jdbc_connection_name"></a> [crawler\_jdbc\_connection\_name](#input\_crawler\_jdbc\_connection\_name) | Specify the jdbc connection name if jdbc is chosen as the crawler target | `string` | `""` | no |
| <a name="input_crawler_jdbc_path"></a> [crawler\_jdbc\_path](#input\_crawler\_jdbc\_path) | Specify the jdbc path if jdbc is chosen as the crawler target | `string` | `""` | no |
| <a name="input_create_table_default_permissions"></a> [create\_table\_default\_permissions](#input\_create\_table\_default\_permissions) | Specify the default table permission | `string` | `"SELECT"` | no |
| <a name="input_data_lake_principal_identifier"></a> [data\_lake\_principal\_identifier](#input\_data\_lake\_principal\_identifier) | Specify the Data Lake principal identifier | `string` | `"IAM_ALLOWED_PRINCIPALS"` | no |
| <a name="input_glue_connection_jdbc_connection_url"></a> [glue\_connection\_jdbc\_connection\_url](#input\_glue\_connection\_jdbc\_connection\_url) | Specify the JDBC connection url for the Glue connection being created | `string` | `""` | no |
| <a name="input_glue_connection_name"></a> [glue\_connection\_name](#input\_glue\_connection\_name) | Specify the name for the glue connection | `string` | `""` | no |
| <a name="input_glue_connection_password"></a> [glue\_connection\_password](#input\_glue\_connection\_password) | Specify the password for the glue connection | `string` | `""` | no |
| <a name="input_glue_connection_username"></a> [glue\_connection\_username](#input\_glue\_connection\_username) | Specify the username for the glue connection | `string` | `""` | no |
| <a name="input_glue_dev_endpoint_name"></a> [glue\_dev\_endpoint\_name](#input\_glue\_dev\_endpoint\_name) | Specify the name of the Glue dev endpoint | `string` | `""` | no |
| <a name="input_is_catalog_target"></a> [is\_catalog\_target](#input\_is\_catalog\_target) | Specify if the target for the Glue Crawler is going to be a Glue catalog | `bool` | `false` | no |
| <a name="input_is_glue_connection"></a> [is\_glue\_connection](#input\_is\_glue\_connection) | Specify whether to create a glue connection | `bool` | `false` | no |
| <a name="input_is_glue_dev_endpoint"></a> [is\_glue\_dev\_endpoint](#input\_is\_glue\_dev\_endpoint) | Specify if we we should create a dev endpoint | `bool` | `false` | no |
| <a name="input_is_jdbc_target"></a> [is\_jdbc\_target](#input\_is\_jdbc\_target) | Specifies whether the target of the crawler is an S3 target | `bool` | `false` | no |
| <a name="input_is_s3_target"></a> [is\_s3\_target](#input\_is\_s3\_target) | Specifies whether the target of the crawler is an S3 target | `bool` | `false` | no |
| <a name="input_physical_conn_availability_zone"></a> [physical\_conn\_availability\_zone](#input\_physical\_conn\_availability\_zone) | Specify the physical connection requirements availability zone | `string` | `""` | no |
| <a name="input_physical_conn_security_group_id"></a> [physical\_conn\_security\_group\_id](#input\_physical\_conn\_security\_group\_id) | Specify the physical connection requirements security group ids | `string` | `""` | no |
| <a name="input_physical_conn_subnet_id"></a> [physical\_conn\_subnet\_id](#input\_physical\_conn\_subnet\_id) | Specify the physical connection requirements subnet id | `string` | `""` | no |
| <a name="input_recrawl_behavior"></a> [recrawl\_behavior](#input\_recrawl\_behavior) | Specify the recrawl behaviour for the glue crawler | `string` | `"CRAWL_EVERYTHING"` | no |
| <a name="input_region"></a> [region](#input\_region) | Specfies the region in which this resouce will be created in | `string` | `"af-south-1"` | no |
| <a name="input_s3_bucket_path"></a> [s3\_bucket\_path](#input\_s3\_bucket\_path) | Specifies the S3 bucket path of an S3 bucket | `string` | `""` | no |
| <a name="input_schema_change_delete_behavior"></a> [schema\_change\_delete\_behavior](#input\_schema\_change\_delete\_behavior) | Specify what should happen on the crawler's deletion behavior | `string` | `"LOG"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_glue_catalog_db_arn"></a> [glue\_catalog\_db\_arn](#output\_glue\_catalog\_db\_arn) | Output the arn of the Catalog DB |
| <a name="output_glue_catalog_db_catalogId"></a> [glue\_catalog\_db\_catalogId](#output\_glue\_catalog\_db\_catalogId) | Output the catalog id of the Catalog DB |
| <a name="output_glue_catalog_db_id"></a> [glue\_catalog\_db\_id](#output\_glue\_catalog\_db\_id) | Output the id of the Catalog DB |
| <a name="output_glue_catalog_db_name"></a> [glue\_catalog\_db\_name](#output\_glue\_catalog\_db\_name) | Output the name of the Catalog DB |
| <a name="output_glue_catalog_table_arn"></a> [glue\_catalog\_table\_arn](#output\_glue\_catalog\_table\_arn) | Output the arn of the Catalog Table |
| <a name="output_glue_catalog_table_name"></a> [glue\_catalog\_table\_name](#output\_glue\_catalog\_table\_name) | Output the name of the Catalog Table |
| <a name="output_glue_connection_arn"></a> [glue\_connection\_arn](#output\_glue\_connection\_arn) | Output the name of the Glue Connection |
| <a name="output_glue_connection_name"></a> [glue\_connection\_name](#output\_glue\_connection\_name) | Output the name of the Glue Connection |
| <a name="output_glue_crawler_arn"></a> [glue\_crawler\_arn](#output\_glue\_crawler\_arn) | Output the arn for the Glue Crawler |
| <a name="output_glue_crawler_id"></a> [glue\_crawler\_id](#output\_glue\_crawler\_id) | Output the arn for the Glue Crawler |
| <a name="output_glue_crawler_name"></a> [glue\_crawler\_name](#output\_glue\_crawler\_name) | Output the name for the Glue Crawler |
| <a name="output_glue_crawler_schedule"></a> [glue\_crawler\_schedule](#output\_glue\_crawler\_schedule) | Output the schedule for the Glue Crawler |
| <a name="output_glue_dev_endpoint_arn"></a> [glue\_dev\_endpoint\_arn](#output\_glue\_dev\_endpoint\_arn) | Specify the arn for the Glue dev endpoint |
| <a name="output_glue_dev_endpoint_private_address"></a> [glue\_dev\_endpoint\_private\_address](#output\_glue\_dev\_endpoint\_private\_address) | Specify the arn for the Glue dev endpoint |
