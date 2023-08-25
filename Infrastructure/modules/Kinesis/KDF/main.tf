locals {
    is_s3_stream          = var.is_s3_consumer ? 1 : 0
    is_redshift_stream    = var.is_redshift_consumer ? 1 : 0
    is_create_s3_bucket   = !var.is_s3_existing_bucket ? 1 : 0
    is_kinesis_stream     = var.is_kinesis_consumer ? 1 : 0

}

data "aws_iam_policy_document" "firehose_assume_role" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["firehose.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

resource "aws_iam_role" "firehose_role" {
  name               = var.firehose_role_name
  assume_role_policy = data.aws_iam_policy_document.firehose_assume_role.json
}


module "s3_bucket" {
  source = "../../S3"
  count  = local.is_create_s3_bucket 

  s3_bucket_name    = var.s3_bucket_name
  s3_policy_actions = var.s3_policy_actions
  s3_tags           = merge(var.kdf_tags) 

}

data "aws_redshift_cluster" "redshift_cluster" {
  cluster_identifier = var.redshift_cluster_identifier
}

data "aws_kinesis_stream" "kinesis_stream" {
  name = var.kinesis_stream_name
}


resource "aws_kinesis_firehose_delivery_stream" "extended_s3_stream" {
  count       = local.is_s3_stream 
  name        = var.firehose_delivery_stream_name
  destination = var.firehose_delivery_stream_destination

  extended_s3_configuration {
    role_arn   = aws_iam_role.firehose_role.arn
    bucket_arn = local.is_create_s3_bucket ? module.s3_bucket[0].arn : var.passed_in_s3_bucket_arn 

    processing_configuration {
      enabled = var.s3_extended_processing_config

      processors {
        type = "Lambda"

        parameters {
          parameter_name  = "LambdaArn"
          parameter_value = "${aws_lambda_function.lambda_processor.arn}:$LATEST"
        }
      }
    }
  }

  tags = merge(var.kdf_tags)
}

resource "aws_kinesis_firehose_delivery_stream" "redshift_stream" {
  count       = local.is_redshift_stream  
  name        = var.firehose_delivery_stream_name
  destination = var.firehose_delivery_stream_destination

  redshift_configuration {
    role_arn           = aws_iam_role.firehose_role.arn
    cluster_jdbcurl    = "jdbc:redshift://${data.aws_redshift_cluster.redshift_cluster.endpoint}/${data.aws_redshift_cluster.redshift_cluster.database_name}"
    username           = var.redshift_username
    password           = var.redshift_password
    data_table_name    = var.redshift_data_table_name
    copy_options       = "delimiter '|'" # the default delimiter
    data_table_columns = "test-col"

    s3_configuration {
      role_arn           = aws_iam_role.firehose_role.arn
      bucket_arn         = local.is_create_s3_bucket ? module.s3_bucket[0].arn : var.passed_in_s3_bucket_arn 
      buffering_size     = 10
      buffering_interval = 400
      compression_format = "GZIP"
    }
  
  }

  tags = merge(var.kdf_tags)
}

resource "aws_kinesis_firehose_delivery_stream" "kinesis_stream" {
  count              = local.is_kinesis_stream
  name               = var.firehose_delivery_stream_name
  kinesis_stream_arn = aws_kinesis_stream.kinesis_stream.arn

  delivery_start_config {
    earliest = var.is_delivery_start_config_earliest
  }

  buffer_config {
    buffer_size     = var.kinesis_stream_buffer_size
    buffer_interval = var.kinesis_stream_buffer_interval
  }

  encryption_config {
    enabled     = var.is_encryption_config
    kms_key_arn = aws_kms_key.kms_key.arn
  }

  tags = merge(var.kdf_tags)
}

resource "aws_kms_key" "kms_key" {
  count                   = var.is_encryption_config ? 1 : 0 
  description             = "KMS key for ${var.firehose_delivery_stream_name}"
  deletion_window_in_days = 50

  tags = merge(var.kdf_tags)
}