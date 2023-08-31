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

| Name | Source | Version |
|------|--------|---------|
| <a name="module_s3_bucket"></a> [s3\_bucket](#module\_s3\_bucket) | ../../S3 | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_iam_role.firehose_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_kinesis_firehose_delivery_stream.extended_s3_stream](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kinesis_firehose_delivery_stream) | resource |
| [aws_kinesis_firehose_delivery_stream.kinesis_stream](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kinesis_firehose_delivery_stream) | resource |
| [aws_kinesis_firehose_delivery_stream.redshift_stream](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kinesis_firehose_delivery_stream) | resource |
| [aws_kms_key.kms_key](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_key) | resource |
| [aws_iam_policy_document.firehose_assume_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_kinesis_stream.kinesis_dest](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/kinesis_stream) | data source |
| [aws_redshift_cluster.redshift_cluster](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/redshift_cluster) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_firehose_delivery_stream_destination"></a> [firehose\_delivery\_stream\_destination](#input\_firehose\_delivery\_stream\_destination) | Specifies the destination of the firehose delivery stream (which is the consumer) | `string` | n/a | yes |
| <a name="input_firehose_delivery_stream_name"></a> [firehose\_delivery\_stream\_name](#input\_firehose\_delivery\_stream\_name) | Specfies the name of the firehose delivery stream being created | `string` | n/a | yes |
| <a name="input_firehose_role_name"></a> [firehose\_role\_name](#input\_firehose\_role\_name) | Specify the name of the role created for the firehose iam role | `string` | n/a | yes |
| <a name="input_is_delivery_start_config_earliest"></a> [is\_delivery\_start\_config\_earliest](#input\_is\_delivery\_start\_config\_earliest) | n/a | `any` | n/a | yes |
| <a name="input_is_encryption_config"></a> [is\_encryption\_config](#input\_is\_encryption\_config) | n/a | `any` | n/a | yes |
| <a name="input_kdf_tags"></a> [kdf\_tags](#input\_kdf\_tags) | value | `map(string)` | n/a | yes |
| <a name="input_kinesis_stream_buffer_interval"></a> [kinesis\_stream\_buffer\_interval](#input\_kinesis\_stream\_buffer\_interval) | n/a | `any` | n/a | yes |
| <a name="input_kinesis_stream_buffer_size"></a> [kinesis\_stream\_buffer\_size](#input\_kinesis\_stream\_buffer\_size) | n/a | `any` | n/a | yes |
| <a name="input_redshift_cluster_identifier"></a> [redshift\_cluster\_identifier](#input\_redshift\_cluster\_identifier) | Specify the indentifier for an exisitng Redshift cluster that's been created | `string` | n/a | yes |
| <a name="input_redshift_data_table_columns"></a> [redshift\_data\_table\_columns](#input\_redshift\_data\_table\_columns) | Specify the data\_table\_colums | `any` | n/a | yes |
| <a name="input_redshift_data_table_name"></a> [redshift\_data\_table\_name](#input\_redshift\_data\_table\_name) | value | `any` | n/a | yes |
| <a name="input_is_kinesis_consumer"></a> [is\_kinesis\_consumer](#input\_is\_kinesis\_consumer) | Specifies whether we need to create a stream to get our data to our Kinesis stream consumer | `bool` | `false` | no |
| <a name="input_is_redshift_consumer"></a> [is\_redshift\_consumer](#input\_is\_redshift\_consumer) | Specifies whether we need to create a stream to get our data to our Redshift consumer | `bool` | `false` | no |
| <a name="input_is_s3_consumer"></a> [is\_s3\_consumer](#input\_is\_s3\_consumer) | Specifies whether we need to create a stream to get data to our S3 consumer and if we need to just pass in the S3 values | `bool` | `false` | no |
| <a name="input_is_s3_existing_bucket"></a> [is\_s3\_existing\_bucket](#input\_is\_s3\_existing\_bucket) | Specfies whether we need to create an S3 bucket for the S3 or Redshift consumers or we just pass in values | `bool` | `false` | no |
| <a name="input_is_s3_extended_processing_config"></a> [is\_s3\_extended\_processing\_config](#input\_is\_s3\_extended\_processing\_config) | Specifies whether we need to do further processing for the extended s3 consumer | `bool` | `false` | no |
| <a name="input_passed_in_s3_bucket_arn"></a> [passed\_in\_s3\_bucket\_arn](#input\_passed\_in\_s3\_bucket\_arn) | Specifies the arn of an existing S3 bucket that will be used by this module | `string` | `""` | no |
| <a name="input_redshift_delimiter"></a> [redshift\_delimiter](#input\_redshift\_delimiter) | value | `string` | `"delimiter '|'"` | no |
| <a name="input_region"></a> [region](#input\_region) | Specfies the region in which this resouce will be created in | `string` | `"af-south-1"` | no |
| <a name="input_s3_bucket_name"></a> [s3\_bucket\_name](#input\_s3\_bucket\_name) | Specifies name for the s3 bucket | `string` | `""` | no |
| <a name="input_s3_policy_actions"></a> [s3\_policy\_actions](#input\_s3\_policy\_actions) | Specifies the policy actions for the S3 bucket being created | `list(string)` | <pre>[<br>  ""<br>]</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_created_s3_bucket_arn"></a> [created\_s3\_bucket\_arn](#output\_created\_s3\_bucket\_arn) | Output of the S3 bucket arn created from the extended S3 module |
| <a name="output_created_s3_bucket_id"></a> [created\_s3\_bucket\_id](#output\_created\_s3\_bucket\_id) | Output of the S3 bucket id created from the extended S3 module |
| <a name="output_created_s3_bucket_path"></a> [created\_s3\_bucket\_path](#output\_created\_s3\_bucket\_path) | Output of the S3 bucket path created from the extended S3 module |
| <a name="output_extended_s3_stream_arn"></a> [extended\_s3\_stream\_arn](#output\_extended\_s3\_stream\_arn) | Output for the delivery stream arn for the extended s3 stream |
| <a name="output_extended_s3_stream_name"></a> [extended\_s3\_stream\_name](#output\_extended\_s3\_stream\_name) | Output for the delivery stream name for the extended s3 stream |
| <a name="output_kinesis_delivery_stream_arn"></a> [kinesis\_delivery\_stream\_arn](#output\_kinesis\_delivery\_stream\_arn) | Output of the delivery stream arn for the kinesis stream |
| <a name="output_kinesis_delivery_stream_name"></a> [kinesis\_delivery\_stream\_name](#output\_kinesis\_delivery\_stream\_name) | Output of the delivery stream name for the kinesis stream |
| <a name="output_redshift_stream_arn"></a> [redshift\_stream\_arn](#output\_redshift\_stream\_arn) | Output for the delivery stream arn for the redshift stream |
| <a name="output_redshift_stream_name"></a> [redshift\_stream\_name](#output\_redshift\_stream\_name) | Output for the delivery stream name for the redshift stream |
