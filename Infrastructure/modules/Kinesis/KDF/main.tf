locals {
    is_s3_stream          = var.is_s3_consumer ? 1 : 0
    is_redshift_stream    = var.is_redshift ? 1 : 0
    is_s3_existing_bucket = !var.is_s3_bucket ? 1 : 0
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
  count  = local.is_s3_existing_bucket 

  s3_bucket_name = var.s3_bucket_name

}

module "redshift" {
  source = "../../Redshift"
  count  = local.is_redshift_stream  
}

resource "aws_kinesis_firehose_delivery_stream" "extended_s3_stream" {
  count       = local.is_s3_stream 
  name        = var.firehose_delivery_stream_name
  destination = var.firehose_delivery_stream_destination

  extended_s3_configuration {
    role_arn   = aws_iam_role.firehose_role.arn
    bucket_arn = module.s3_bucket.ouputs.s3_bucket_arn

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
}

resource "aws_kinesis_firehose_delivery_stream" "redshift_stream" {
  count       = local.is_redshift_stream  || local.is_s3_stream  
  name        = var.firehose_delivery_stream_name
  destination = var.firehose_delivery_stream_destination

  redshift_configuration {
    role_arn           = aws_iam_role.firehose_role.arn
    cluster_jdbcurl    = "jdbc:redshift://${aws_redshift_cluster.test_cluster.endpoint}/${aws_redshift_cluster.test_cluster.database_name}"
    username           = module.redshift.output.redshift_username
    password           = module.redshift.output.redshift_password
    data_table_name    = module.redshift.output.redshift_data_table_name
    copy_options       = "delimiter '|'" # the default delimiter
    data_table_columns = "test-col"
    s3_backup_mode     = "Enabled"

    s3_configuration {
      role_arn           = aws_iam_role.firehose_role.arn
      bucket_arn         = aws_s3_bucket.bucket.arn
      buffering_size     = 10
      buffering_interval = 400
      compression_format = "GZIP"
    }

    s3_backup_configuration {
      role_arn           = aws_iam_role.firehose_role.arn
      bucket_arn         = aws_s3_bucket.bucket.arn
      buffering_size     = 15
      buffering_interval = 300
      compression_format = "GZIP"
    }
  }
}