locals {
  S3_tags = {
    "project-name" : "disraptor-jenkins",
    "owner"        : "shibule",
    "application"  : "jenkins",
    "environment"  : "prod"
  }
}

resource "aws_s3_bucket" "jenkins_bucket" {
  bucket = "disraptor-jenkins"
  tags   = merge(local.S3_tags)
}

resource "aws_s3_bucket_versioning" "bucket_verisoning" {
  bucket = aws_s3_bucket.jenkins_bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_kms_key" "bucket_kms_key" {
  description         = "KMS key for ${aws_s3_bucket.jenkins_bucket.id}"
  enable_key_rotation = true
  # auto renewal 

  tags = merge(local.S3_tags)
}

resource "aws_s3_bucket_server_side_encryption_configuration" "s3_bucket_encryption" {
  bucket = aws_s3_bucket.jenkins_bucket.id

  rule {
    apply_server_side_encryption_by_default {
      kms_master_key_id = aws_kms_key.bucket_kms_key.arn
      sse_algorithm     = "aws:kms"
    }
  }
}

data "aws_lambda_function" "docker_creator" {

}

resource "aws_s3_bucket_notification" "event_trigger" {
    bucket = aws_s3_bucket.jenkins_bucket.id
    
    lambda_function {
        lambda_function_arn = var.lambda_function_arn
        events              = ["s3:ObjectCreated:*"]
        filter_prefix       = "uploads/"
    }
  
}