resource "aws_cloudfront_origin_access_control" "aws_cloudfront_origin_access_control" {
  name                              = var.cloudfront_access_control_name
  description                       = var.cloudfront_access_control_description
  origin_access_control_origin_type = "s3"
  signing_behavior                  = "always"
  signing_protocol                  = "sigv4"
}

resource "aws_cloudfront_distribution" "cdn" {
  origin {
    domain_name              = var.domain_name
    origin_access_control_id = aws_cloudfront_origin_access_control.aws_cloudfront_origin_access_control.id
    origin_id                = var.origin_id
  }

  dynamic "origin_group" {
    for_each = var.origin_group
    content {
      origin_id = origin_group.value.origin_group_id

      failover_criteria {
        status_codes = origin_group.value.status_codes
      }

      member {
        origin_id = origin_group.value.orgin_member_id
      }

      member {
        origin_id = origin_group.value.orgin_failover_id
      }
    }
  }

  dynamic "origin" {
    for_each = var.primaryS3
    content {
      domain_name = primaryS3.value.domain_name
      origin_id   = "primaryS3"
      s3_origin_config {
        origin_access_identity = primaryS3.value.origin_access_identity
      }
    }
  }

  dynamic "origin" {
    for_each = var.primaryS3
    content {
      domain_name = primaryS3.value.domain_name
      origin_id   = "failoverS3"
      s3_origin_config {
        origin_access_identity = primaryS3.value.origin_access_identity
      }
    }
  }

  tags = var.cloudfront_tags

  enabled             = true
  is_ipv6_enabled     = true
  default_root_object = "index.html"

  dynamic "logging_config" {
    for_each = var.logging_config
    content {
      include_cookies = logging_config.include_cookies
      bucket          = logging_config.bucket
      prefix          = logging_config.prefix
    }
  }

  dynamic "default_cache_behavior" {
    for_each = var.default_cache_behavior
    content {
      allowed_methods  = default_cache_behavior.value.allowed_methods
      cached_methods   = default_cache_behavior.value.cached_methods
      target_origin_id = default_cache_behavior.value.target_origin_id

      viewer_protocol_policy = default_cache_behavior.value.viewer_protocol_policy
      min_ttl                = default_cache_behavior.value.min_ttl
      default_ttl            = default_cache_behavior.value.default_ttl
      max_ttl                = default_cache_behavior.value.max_ttl

      dynamic "forwarded_values" {
        for_each = var.forwarded_values
        content {
          query_string = forwarded_values.value.query_string
          cookies {
            forward = forwarded_values.value.forward
          }
        }
      }
    }
  }

  dynamic "ordered_cache_behavior" {
    for_each = var.ordered_cache_behavior
    content {
      path_pattern     = ordered_cache_behavior.value.path_pattern
      allowed_methods  = ordered_cache_behavior.value.allowed_methods
      cached_methods   = ordered_cache_behavior.value.cached_methods
      target_origin_id = ordered_cache_behavior.value.target_origin_id

      forwarded_values {
        query_string = ordered_cache_behavior.value.query_string
        headers      = ordered_cache_behavior.value.headers
        cookies {
          forward = ordered_cache_behavior.value.cookies_foward
        }
      }
      min_ttl                = ordered_cache_behavior.value.min_ttl
      default_ttl            = ordered_cache_behavior.value.default_ttl
      max_ttl                = ordered_cache_behavior.value.max_ttl
      compress               = ordered_cache_behavior.value.compress
      viewer_protocol_policy = ordered_cache_behavior.value.viewer_protocol_policy
    }
  }

  dynamic "restrictions" {
    for_each = var.restrictions
    content {
      geo_restriction {
        restriction_type = restrictions.restriction_type
        locations        = restrictions.locations
      }
    }
  }

  viewer_certificate {
    cloudfront_default_certificate = var.cloudfront_default_certificate
  }
}


