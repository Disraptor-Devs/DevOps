locals {
  s3_origin_id = "myS3Origin"
}

data "aws_s3_bucket" "website_bucket" {
  bucket = var.website_bucket
}

resource "aws_cloudfront_origin_access_control" "aws_cloudfront_origin_access_control" {
  name                              = var.cloudfront_access_control_name
  description                       = var.cloudfront_access_control_description
  origin_access_control_origin_type = "s3"
  signing_behavior                  = "always"
  signing_protocol                  = "sigv4"
}

resource "aws_cloudfront_distribution" "cdn" {
  origin {
    domain_name              = data.aws_s3_bucket.existing_bucket.bucket_regional_domain_name
    origin_access_control_id = aws_cloudfront_origin_access_control.aws_cloudfront_origin_access_control.id
    origin_id                = local.s3_origin_id
  }

  tags = {
    Name        = var.tag_name,
    owner       = "disraptor",
    environment = var.environment,
    service     = "CloudFront",
    type        = "application"
  }

  enabled             = true
  is_ipv6_enabled     = true
  default_root_object = "index.html"

  logging_config {
    include_cookies = false
    bucket          = var.s3_cloudfront_logging_bucket
    prefix          = var.prefix_value
  }
  default_cache_behavior {
    allowed_methods  = ["DELETE", "GET", "HEAD", "OPTIONS", "PATCH", "POST", "PUT"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = local.s3_origin_id

    forwarded_values {
      query_string = false

      cookies {
        forward = "none"
      }
    }
    viewer_protocol_policy = "allow-all"
    min_ttl                = 0
    default_ttl            = 600
    max_ttl                = 900
  }

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  viewer_certificate {
    cloudfront_default_certificate = true
  }
}


