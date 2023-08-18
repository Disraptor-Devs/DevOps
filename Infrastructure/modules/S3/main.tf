
data "aws_caller_identity" "current" {}

resource "aws_s3_bucket" "s3_bucket" {
  bucket = var.s3_bucket_name
  tags   = merge(var.s3_tags)
}

resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.s3_bucket.id
  versioning_configuration {
    status = var.s3_bucket_versioning
  }
}

resource "aws_s3_bucket_acl" "aws_s3_bucket_acl" {
  bucket = aws_s3_bucket.s3_bucket.id
  acl    = var.s3_bucket_acl
}

data "aws_iam_policy_document" "bucket_policy_doc" {
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