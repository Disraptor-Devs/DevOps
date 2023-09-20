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
| [aws_iam_role.firehose_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.firehose_creation](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.firehose_policy_attachment](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_kinesis_firehose_delivery_stream.extended_s3_stream](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kinesis_firehose_delivery_stream) | resource |
| [aws_kinesis_firehose_delivery_stream.redshift_stream](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kinesis_firehose_delivery_stream) | resource |
| [aws_kms_key.kms_key](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_key) | resource |
| [aws_iam_policy_document.firehose_assume_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_firehose_delivery_stream_destination"></a> [firehose\_delivery\_stream\_destination](#input\_firehose\_delivery\_stream\_destination) | Specifies the destination of the firehose delivery stream (which is the consumer) | `string` | n/a | yes |
| <a name="input_firehose_delivery_stream_name"></a> [firehose\_delivery\_stream\_name](#input\_firehose\_delivery\_stream\_name) | Specfies the name of the firehose delivery stream being created | `string` | n/a | yes |
| <a name="input_firehose_role_name"></a> [firehose\_role\_name](#input\_firehose\_role\_name) | Specify the name of the role created for the firehose iam role | `string` | n/a | yes |
| <a name="input_kdf_tags"></a> [kdf\_tags](#input\_kdf\_tags) | Specify the tags to assign to the KDH delivery streams that are created | `map(string)` | n/a | yes |
| <a name="input_error_output_prefix"></a> [error\_output\_prefix](#input\_error\_output\_prefix) | Specify the Error prefix for the extended S3 configuration | `string` | `"error-"` | no |
| <a name="input_extended_s3_buffer_size"></a> [extended\_s3\_buffer\_size](#input\_extended\_s3\_buffer\_size) | Specify the buffer size for the extended S3 configuration | `number` | `0` | no |
| <a name="input_is_cloudwatch_logging"></a> [is\_cloudwatch\_logging](#input\_is\_cloudwatch\_logging) | Specify whether we enable cloud watch logging for the redshift and extended s3 streams | `bool` | `false` | no |
| <a name="input_is_delivery_start_config_earliest"></a> [is\_delivery\_start\_config\_earliest](#input\_is\_delivery\_start\_config\_earliest) | Specify if the delivery start time of the s | `bool` | `false` | no |
| <a name="input_is_encryption_config"></a> [is\_encryption\_config](#input\_is\_encryption\_config) | Specify if we will provide encryption for the delivery stream for Kinesis | `bool` | `false` | no |
| <a name="input_is_kinesis_consumer"></a> [is\_kinesis\_consumer](#input\_is\_kinesis\_consumer) | Specifies whether we need to create a stream to get our data to our Kinesis stream consumer | `bool` | `false` | no |
| <a name="input_is_lambda_processor"></a> [is\_lambda\_processor](#input\_is\_lambda\_processor) | Specify whether we'll use Lambda for our processing of data on the extended S3 config | `bool` | `"false"` | no |
| <a name="input_is_redshift_consumer"></a> [is\_redshift\_consumer](#input\_is\_redshift\_consumer) | Specifies whether we need to create a stream to get our data to our Redshift consumer | `bool` | `false` | no |
| <a name="input_is_s3_consumer"></a> [is\_s3\_consumer](#input\_is\_s3\_consumer) | Specifies whether we need to create a stream to get data to our S3 consumer and if we need to just pass in the S3 values | `bool` | `false` | no |
| <a name="input_is_s3_extended_processing_config"></a> [is\_s3\_extended\_processing\_config](#input\_is\_s3\_extended\_processing\_config) | Specifies whether we need to do further processing for the extended s3 consumer | `bool` | `false` | no |
| <a name="input_kinesis_stream_arn"></a> [kinesis\_stream\_arn](#input\_kinesis\_stream\_arn) | specify the kinesis stream arn to be procided in the extended s3 config | `string` | `""` | no |
| <a name="input_kinesis_stream_buffer_interval"></a> [kinesis\_stream\_buffer\_interval](#input\_kinesis\_stream\_buffer\_interval) | Specify the buffer interval for the delivery stream for Kinesis in seconds | `number` | `0` | no |
| <a name="input_kinesis_stream_buffer_size"></a> [kinesis\_stream\_buffer\_size](#input\_kinesis\_stream\_buffer\_size) | Specify the buffer size for the delivery stream for Kinesis in seconds | `number` | `0` | no |
| <a name="input_lambda_processor_arn"></a> [lambda\_processor\_arn](#input\_lambda\_processor\_arn) | Specify The lambda processor arn for the extended S3 configuration if process configuration has been enabled | `string` | `""` | no |
| <a name="input_log_group_name"></a> [log\_group\_name](#input\_log\_group\_name) | Specify the log group name if cloudwatch logging has been enabled | `string` | `""` | no |
| <a name="input_log_stream_name"></a> [log\_stream\_name](#input\_log\_stream\_name) | Specify the log stream name of the cloudwatch logging has been enabled | `string` | `""` | no |
| <a name="input_passed_in_s3_bucket_arn"></a> [passed\_in\_s3\_bucket\_arn](#input\_passed\_in\_s3\_bucket\_arn) | Specifies the arn of an existing S3 bucket that will be used by this module | `string` | `""` | no |
| <a name="input_redhift_cluster_jdbc_url"></a> [redhift\_cluster\_jdbc\_url](#input\_redhift\_cluster\_jdbc\_url) | Specify the Redshift cluster jdbc url for the redshift firehose delivery stream | `string` | `""` | no |
| <a name="input_redshift_data_table_columns"></a> [redshift\_data\_table\_columns](#input\_redshift\_data\_table\_columns) | Specify the redshift data table columns | `string` | `""` | no |
| <a name="input_redshift_data_table_name"></a> [redshift\_data\_table\_name](#input\_redshift\_data\_table\_name) | Specify the redshift data table name | `string` | `""` | no |
| <a name="input_redshift_delimiter"></a> [redshift\_delimiter](#input\_redshift\_delimiter) | Specify the default delimiter | `string` | `"delimiter '|'"` | no |
| <a name="input_redshift_passw"></a> [redshift\_passw](#input\_redshift\_passw) | Specify the value of the redshift password to be used for the redshift config | `string` | `""` | no |
| <a name="input_redshift_usernmae"></a> [redshift\_usernmae](#input\_redshift\_usernmae) | Specify the value of the redshift username for the reshift config | `string` | `""` | no |
| <a name="input_region"></a> [region](#input\_region) | Specfies the region in which this resouce will be created in | `string` | `"af-south-1"` | no |
| <a name="input_s3_buffering_interval"></a> [s3\_buffering\_interval](#input\_s3\_buffering\_interval) | Specify the buffering interval for the S3 config for the redshift stream | `number` | `400` | no |
| <a name="input_s3_buffering_size"></a> [s3\_buffering\_size](#input\_s3\_buffering\_size) | Specify the buffering size for the S3 config for the redshift stream | `number` | `10` | no |
| <a name="input_s3_compression_format"></a> [s3\_compression\_format](#input\_s3\_compression\_format) | Specify the compression format for the S3 config for the redshift stream | `string` | `"GZIP"` | no |
| <a name="input_s3_processors"></a> [s3\_processors](#input\_s3\_processors) | Specify the processor for the extended S3 config | `string` | `"Lambda"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_extended_s3_stream_arn"></a> [extended\_s3\_stream\_arn](#output\_extended\_s3\_stream\_arn) | Output for the delivery stream arn for the extended s3 stream |
| <a name="output_extended_s3_stream_name"></a> [extended\_s3\_stream\_name](#output\_extended\_s3\_stream\_name) | Output for the delivery stream name for the extended s3 stream |
| <a name="output_redshift_stream_arn"></a> [redshift\_stream\_arn](#output\_redshift\_stream\_arn) | Output for the delivery stream arn for the redshift stream |
| <a name="output_redshift_stream_name"></a> [redshift\_stream\_name](#output\_redshift\_stream\_name) | Output for the delivery stream name for the redshift stream |
