locals {
  create_logging_bucket = var.is_logging_bucket ? 1 : 0
}

data "aws_caller_identity" "current" {}

resource "aws_s3_bucket" "s3_bucket" {
  bucket = var.s3_bucket_name
  tags   = merge(var.s3_tags)
}

resource "aws_s3_bucket" "logging_bucket" {
  count  = local.create_logging_bucket
  bucket = "${var.s3_bucket_name}-logs"
  tags   = merge(var.s3_tags)
}

resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.s3_bucket.id
  versioning_configuration {
    status = var.s3_bucket_versioning
  }
}

resource "aws_s3_bucket_ownership_controls" "owner" {
  bucket = aws_s3_bucket.example.id
  rule {
    object_ownership = var.object_ownership
  }
}

resource "aws_s3_bucket_public_access_block" "example" {
  bucket = aws_s3_bucket.example.id

  block_public_acls       = var.is_block_public_acls
  block_public_policy     = var.is_block_public_policy
  ignore_public_acls      = var.is_ignore_public_acls
  restrict_public_buckets = var.is_restrict_public_buckets
}


resource "aws_s3_bucket_acl" "aws_s3_bucket_acl" {
  bucket = aws_s3_bucket.s3_bucket.id
  acl    = var.s3_bucket_acl
}

data "aws_iam_policy_document" "bucket_policy_doc" {
  id = "${var.s3_bucket_name}-policy"

  statement {
    principals {
      type        = "AWS"
      identifiers = [data.aws_caller_identity.current.account_id]
    }

    actions = [var.s3_policy_actions]

    resources = [
      aws_s3_bucket.s3_bucket.arn,
      "${aws_s3_bucket.s3_bucket.arn}/*",
    ]
  }
}

resource "aws_s3_bucket_policy" "bucket_policy" {
  bucket = aws_s3_bucket.s3_bucket.id
  policy = data.aws_iam_policy_document.bucket_policy_doc.json
}

resource "aws_kms_key" "bucket_kms_key" {
  description             = "KMS key for ${var.s3_bucket_name}"
  deletion_window_in_days = 50

  tags = merge(var.s3_tags)
}

resource "aws_s3_bucket_server_side_encryption_configuration" "s3_bucket_encryption" {
  bucket = aws_s3_bucket.s3_bucket.id

  rule {
    apply_server_side_encryption_by_default {
      kms_master_key_id = aws_kms_key.bucket_kms_key.arn
      sse_algorithm     = "aws:kms"
    }
  }
}

resource "aws_s3_bucket_acl" "log_bucket_acl" {
  count  = local.create_logging_bucket
  bucket = aws_s3_bucket.logging_bucket[0].id
  acl    = "log-delivery-write"
}

resource "aws_s3_bucket_logging" "bucket_logging" {
  count         = local.create_logging_bucket
  bucket        = aws_s3_bucket.s3_bucket.id
  target_bucket = aws_s3_bucket.logging_bucket[0].id
  target_prefix = var.target_prefix
}

resource "aws_s3_bucket_notification" "bucket_notification" {
  count  = var.is_bucket_notification ? 1 : 0 
  bucket = aws_s3_bucket.s3_bucket.id

  topic {
    topic_arn     = var.sns_topic_arn
    events        = var.s3_bucket_notification_events
    filter_suffix = ".log"
  }
}

resource "aws_s3_access_point" "example" {
  bucket = aws_s3_bucket.s3_bucket.id
  name   = "${var.s3_bucket_name}-ap"
}

resource "aws_s3_bucket_lifecycle_configuration" "example_lifecycle" {
  rule {
    id      = var.lifecylce_name
    status  = var.lifecylce_status

    transition {
      days          = var.lifecycle_transition_days
      storage_class = var.lifecycle_storage_clas  # The desired storage class
    }
  }

  # Attach the lifecycle configuration to the bucket
  bucket = aws_s3_bucket.s3_bucket.id
}