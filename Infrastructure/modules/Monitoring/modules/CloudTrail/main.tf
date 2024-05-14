

resource "aws_s3_bucket" "cloudtrail_bucket" {
  count         = var.create_cloudtrail_bucket ? 1 : 0
  bucket        = var.create_cloudtrail_bucket ? var.cloudtrail_bucket_name : null
  force_destroy = var.create_cloudtrail_bucket ? true : null
}

resource "aws_cloudtrail" "default" {
  count                         = var.create_cloudtrail ? 1 : 0
  name                          = var.create_cloudtrail ? "${var.environment}-${var.stage}-${var.cloudtrail_name}" : null
  s3_bucket_name                = var.create_cloudtrail ? aws_s3_bucket.cloudtrail_bucket[0].bucket : null
  enable_log_file_validation    = var.create_cloudtrail ? true : null
  include_global_service_events = var.create_cloudtrail ? true : null
}

resource "aws_s3_bucket" "s3_bucket_logging" {
  count = var.create_s3_bucket_logging ? 1 : 0
  bucket = var.s3_bucket_logging_name
  
}

resource "aws_cloudtrail" "s3_bucket_logging" {
  count                         = var.create_s3_bucket_logging ? 1 : 0
  name                          = var.create_s3_bucket_logging ? "${var.environment}-${var.stage}-${var.s3_bucket_logging_name}" : null
  s3_bucket_name                = var.create_s3_bucket_logging ? aws_s3_bucket.s3_bucket_logging[0].bucket : null
  enable_log_file_validation    = var.create_s3_bucket_logging ? true : null
  include_global_service_events = var.create_s3_bucket_logging ? true : null
}
