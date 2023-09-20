locals {
  is_s3_stream        = var.is_s3_consumer ? 1 : 0
  is_redshift_stream  = var.is_redshift_consumer ? 1 : 0
  is_kinesis_stream   = var.is_kinesis_consumer ? 1 : 0
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

resource "aws_iam_role_policy_attachment" "firehose_policy_attachment" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonKinesisFullAccess"
  role       = aws_iam_role.firehose_role.name
}

resource "aws_iam_role_policy_attachment" "firehose_creation" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
  role       = aws_iam_role.firehose_role.name
  
}

resource "aws_kinesis_firehose_delivery_stream" "extended_s3_stream" {
  count       = local.is_s3_stream
  name        = var.firehose_delivery_stream_name
  destination = var.firehose_delivery_stream_destination

  extended_s3_configuration {
    role_arn   = aws_iam_role.firehose_role.arn
    bucket_arn = var.passed_in_s3_bucket_arn

    buffering_size      = var.extended_s3_buffer_size
    error_output_prefix = var.error_output_prefix

    cloudwatch_logging_options {
      enabled         = var.is_cloudwatch_logging
      log_group_name  = var.log_group_name
      log_stream_name = var.log_stream_name
    }

    processing_configuration {
      enabled = var.is_s3_extended_processing_config

      dynamic "processors" {
        for_each = var.is_lambda_processor ? [1] : [0]
        content {
          type = var.s3_processors

        parameters {
          parameter_name  = "LambdaArn"
          parameter_value = var.is_lambda_processor ? "${var.lambda_processor_arn}:$LATEST" : null
        }
      }
    }
   }
  }

  kinesis_source_configuration {
    kinesis_stream_arn = var.kinesis_stream_arn
    role_arn           = aws_iam_role.firehose_role.arn
  }

  tags = merge(var.kdf_tags)
}

resource "aws_kinesis_firehose_delivery_stream" "redshift_stream" {
  count       = local.is_redshift_stream
  name        = var.firehose_delivery_stream_name
  destination = var.firehose_delivery_stream_destination

  redshift_configuration {
    role_arn           = aws_iam_role.firehose_role.arn
    # cluster_jdbcurl    = "jdbc:redshift://${data.aws_redshift_cluster.redshift_cluster.endpoint}/${data.aws_redshift_cluster.redshift_cluster.database_name}"
    cluster_jdbcurl    = var.redhift_cluster_jdbc_url 
    username           = var.redshift_usernmae
    password           = var.redshift_passw
    data_table_name    = var.redshift_data_table_name
    copy_options       = var.redshift_delimiter # the default delimiter
    data_table_columns = var.redshift_data_table_columns

    cloudwatch_logging_options {
      enabled         = var.is_cloudwatch_logging
      log_group_name  = var.log_group_name
      log_stream_name = var.log_stream_name
    }

    s3_configuration {
      role_arn           = aws_iam_role.firehose_role.arn
      bucket_arn         = var.passed_in_s3_bucket_arn
      buffering_size     = var.s3_buffering_size
      buffering_interval = var.s3_buffering_interval
      compression_format = var.s3_compression_format
    }

  }

  tags = merge(var.kdf_tags)
}


resource "aws_kms_key" "kms_key" {
  count               = var.is_encryption_config ? 1 : 0
  description         = "KMS key for ${var.firehose_delivery_stream_name}"
  enable_key_rotation = true

  tags = merge(var.kdf_tags)
}