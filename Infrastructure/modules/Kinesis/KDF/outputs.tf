output "extended_s3_stream_arn" {
  description = "Output for the delivery stream arn for the extended s3 stream"
  value       = aws_kinesis_firehose_delivery_stream.extended_s3_stream[0].arn
}

output "extended_s3_stream_name" {
  description = "Output for the delivery stream name for the extended s3 stream"
  value       = aws_kinesis_firehose_delivery_stream.extended_s3_stream[0].name
}

output "redshift_stream_arn" {
  description = "Output for the delivery stream arn for the redshift stream"
  value       = aws_kinesis_firehose_delivery_stream.redshift_stream[0].arn
}

output "redshift_stream_name" {
  description = "Output for the delivery stream name for the redshift stream"
  value       = aws_kinesis_firehose_delivery_stream.redshift_stream[0].name
}

output "kinesis_delivery_stream_arn" {
  description = "Output of the delivery stream arn for the kinesis stream"
  value       = aws_kinesis_firehose_delivery_stream.kinesis_stream[0].arn
}

output "kinesis_delivery_stream_name" {
  description = "Output of the delivery stream name for the kinesis stream"
  value       = aws_kinesis_firehose_delivery_stream.kinesis_stream[0].name
}