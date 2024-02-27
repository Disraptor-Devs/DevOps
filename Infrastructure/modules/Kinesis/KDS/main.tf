resource "aws_kms_key" "stream_kms_key" {
  description         = "KMS key for ${var.kinesis_data_stream_name}"
  enable_key_rotation = true

  tags = merge(var.kds_tags)
}


resource "aws_kinesis_stream" "kinesis_stream" {
  name             = var.kinesis_data_stream_name
  shard_count      = var.kinesis_shard_count
  retention_period = var.kinesis_retention_period

  encryption_type = var.kinesis_encryption_type
  kms_key_id      = aws_kms_key.stream_kms_key.id

  shard_level_metrics = var.kinesis_shard_level_metrics

  stream_mode_details {
    stream_mode = var.kinesis_stream_mode_details
  }

  tags = merge(var.kds_tags)
}

resource "aws_kinesis_stream_consumer" "stream_consumer" {
  name       = var.kinesis_consumer_name
  stream_arn = aws_kinesis_stream.kinesis_stream.arn
}
