output "stream_arn" {
  description = "Output of the kinesis stream arn"
  value       = aws_kinesis_stream.kinesis_stream.arn
}

output "stream_name" {
  description = "Output of the kinesis stream name"
  value       = aws_kinesis_stream.kinesis_stream.name
}

output "stream_kms_key_arn" {
  description = "Output of the KMS key arn associated with the stream"
  value       = aws_kms_key.stream_kms_key.arn
}

output "stream_consumer_arn" {
  description = "Output of the Stream consumer arn"
  value       = var.is_kinesis_consumer ? aws_kinesis_stream_consumer.stream_consumer.arn : null
}

output "stream_consumer_name" {
  description = "Output of the Stream consumer name"
  value       = var.is_kinesis_consumer ? aws_kinesis_stream_consumer.stream_consumer.name : null
}
