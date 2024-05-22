resource "aws_s3_bucket" "cloudwatch_logs_bucket" {
  bucket = var.cloudFront_logging_bucket_name
  tags = {
    Name        = var.tag_name,
    owner       = "disraptor",
    environment = var.environment,
    service     = "S3 Static Webiste",
    type        = "application"
  }
}

data "aws_iam_policy_document" "cf_bucket_policy" {
  statement {
    effect    = "Allow"
    actions   = ["s3:*"]
    resources = ["${aws_s3_bucket.cloudwatch_logs_bucket.arn}/*"]
    condition {
      test     = "StringEquals"
      variable = "s3:x-amz-acl"
      values   = ["bucket-owner-full-control"]
    }
    principals {
      type        = "Service"
      identifiers = ["cloudfront.amazonaws.com"]
    }
  }
}


resource "aws_s3_bucket_policy" "bucket_policy" {
  bucket = aws_s3_bucket.cloudwatch_logs_bucket.id
  policy = data.aws_iam_policy_document.cf_bucket_policy.json
}


resource "aws_s3_bucket_ownership_controls" "bucket_ownership" {
  bucket = aws_s3_bucket.cloudwatch_logs_bucket.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_acl" "bucket_acl" {
  depends_on = [aws_s3_bucket_ownership_controls.bucket_ownership]

  bucket = aws_s3_bucket.cloudwatch_logs_bucket.id
  acl    = "private"
}
