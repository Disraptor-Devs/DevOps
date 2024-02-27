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
| [aws_kinesis_stream.kinesis_stream](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kinesis_stream) | resource |
| [aws_kinesis_stream_consumer.stream_consumer](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kinesis_stream_consumer) | resource |
| [aws_kms_key.stream_kms_key](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_key) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_kds_tags"></a> [kds\_tags](#input\_kds\_tags) | Provide tags (key, value pairs) for the stream being created | `map(string)` | n/a | yes |
| <a name="input_kinesis_data_stream_name"></a> [kinesis\_data\_stream\_name](#input\_kinesis\_data\_stream\_name) | Specfies the name for the kinesis stream that will be creatd | `string` | n/a | yes |
| <a name="input_kinesis_retention_period"></a> [kinesis\_retention\_period](#input\_kinesis\_retention\_period) | Specfies how long the data in the stream should be kept for | `number` | n/a | yes |
| <a name="input_kinesis_shard_count"></a> [kinesis\_shard\_count](#input\_kinesis\_shard\_count) | Specfies the number of shards for the kinesis stream being created | `number` | n/a | yes |
| <a name="input_enforce_consumer_deletion"></a> [enforce\_consumer\_deletion](#input\_enforce\_consumer\_deletion) | Specifies if registered consumers should be deregistered from the stream so that the stream can be destroyed. | `bool` | `false` | no |
| <a name="input_kinesis_consumer_name"></a> [kinesis\_consumer\_name](#input\_kinesis\_consumer\_name) | Specify the name of the Kinesis stream consumer | `string` | `null` | no |
| <a name="input_kinesis_encryption_type"></a> [kinesis\_encryption\_type](#input\_kinesis\_encryption\_type) | Specify the type of encryption to apply to the stream | `string` | `"KMS"` | no |
| <a name="input_kinesis_shard_level_metrics"></a> [kinesis\_shard\_level\_metrics](#input\_kinesis\_shard\_level\_metrics) | Specfies the shard level metrics for our shard | `set(string)` | <pre>[<br>  "IncomingBytes",<br>  "OutgoingBytes"<br>]</pre> | no |
| <a name="input_kinesis_stream_mode_details"></a> [kinesis\_stream\_mode\_details](#input\_kinesis\_stream\_mode\_details) | Specifies the stream mode for the kinesis stream being created | `string` | `"PROVISIONED"` | no |
| <a name="input_region"></a> [region](#input\_region) | Specfies the region in which this resouce will be created in | `string` | `"af-south-1"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_stream_arn"></a> [stream\_arn](#output\_stream\_arn) | Output of the kinesis stream arn |
| <a name="output_stream_consumer_arn"></a> [stream\_consumer\_arn](#output\_stream\_consumer\_arn) | Output of the Stream consumer arn |
| <a name="output_stream_consumer_name"></a> [stream\_consumer\_name](#output\_stream\_consumer\_name) | Output of the Stream consumer name |
| <a name="output_stream_kms_key_arn"></a> [stream\_kms\_key\_arn](#output\_stream\_kms\_key\_arn) | Output of the KMS key arn associated with the stream |
| <a name="output_stream_name"></a> [stream\_name](#output\_stream\_name) | Output of the kinesis stream name |
