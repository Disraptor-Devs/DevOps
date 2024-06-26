resource "aws_s3_bucket" "website_hosting" {
  bucket = var.bucket_name

  tags = {
    Name        = var.tag_name,
    owner       = "disraptor",
    environment = var.environment,
    service     = "S3 Static Webiste",
    type        = "application"
  }
}

resource "aws_s3_bucket_public_access_block" "s3_bucket_public_access_block" {
  bucket                  = aws_s3_bucket.website_hosting.id
  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_ownership_controls" "ownership_controls" {
  
  bucket = aws_s3_bucket.website_hosting.id
  rule {
    object_ownership = "ObjectWriter"
  }
}

resource "aws_s3_bucket_acl" "bucket_acl" {
  depends_on = [aws_s3_bucket_ownership_controls.ownership_controls,
  aws_s3_bucket_public_access_block.s3_bucket_public_access_block]

  bucket = aws_s3_bucket.website_hosting.id
  acl    = "public-read"
}

resource "aws_s3_bucket_website_configuration" "website_config" {
  bucket = aws_s3_bucket.website_hosting.id

  index_document {
    suffix = var.index_document
  }

  error_document {
    key = var.error_document
  }
}

data "aws_iam_policy_document" "s_bucket_hosting_policy" {
  statement {
    effect  = "Allow"
    actions = ["s3:*"]
    principals {
      type        = "*"
      identifiers = ["*"]
    }
    resources = [aws_s3_bucket.website_hosting.arn]
  }
}

resource "aws_s3_bucket_policy" "website_bucket_policy" {
  bucket = aws_s3_bucket.website_hosting.id
  policy = data.aws_iam_policy_document.s_bucket_hosting_policy.json
}
