# Define a CloudFront Origin Access Control resource
resource "aws_cloudfront_origin_access_control" "aws_cloudfront_origin_access_control" {
  name                              = var.cloudfront_access_control_name        # Name of the access control
  description                       = var.cloudfront_access_control_description # Description of the access control
  origin_access_control_origin_type = "s3"                                      # Type of origin, set to S3
  signing_behavior                  = "always"                                  # Signing behavior, always sign requests
  signing_protocol                  = "sigv4"                                   # Signing protocol, use AWS Signature Version 4
}

# Define a CloudFront Distribution resource
resource "aws_cloudfront_distribution" "cdn" {
  origin {
    domain_name              = var.domain_name                                                              # Domain name of the origin server
    origin_access_control_id = aws_cloudfront_origin_access_control.aws_cloudfront_origin_access_control.id # Reference to the origin access control ID
    origin_id                = var.origin_id                                                                # Identifier for the origin
  }

  # Dynamic block to define an origin group
  dynamic "origin_group" {
    for_each = var.origin_group
    content {
      origin_id = origin_group.value.origin_group_id # ID for the origin group

      failover_criteria {
        status_codes = origin_group.value.status_codes # HTTP status codes that trigger failover
      }

      member {
        origin_id = origin_group.value.orgin_member_id # ID for the primary origin in the group
      }

      member {
        origin_id = origin_group.value.orgin_failover_id # ID for the failover origin in the group
      }
    }
  }

  # Dynamic block to define the primary S3 origin
  dynamic "origin" {
    for_each = var.primaryS3
    content {
      domain_name = primaryS3.value.domain_name # Domain name of the primary S3 bucket
      origin_id   = "primaryS3"                 # Identifier for the primary S3 origin
      s3_origin_config {
        origin_access_identity = primaryS3.value.origin_access_identity # Origin access identity for the S3 bucket
      }
    }
  }

  # Dynamic block to define the failover S3 origin
  dynamic "origin" {
    for_each = var.primaryS3
    content {
      domain_name = primaryS3.value.domain_name # Domain name of the failover S3 bucket
      origin_id   = "failoverS3"                # Identifier for the failover S3 origin
      s3_origin_config {
        origin_access_identity = primaryS3.value.origin_access_identity # Origin access identity for the S3 bucket
      }
    }
  }

  tags = var.cloudfront_tags # Tags to apply to the CloudFront distribution

  enabled             = true         # Enable the distribution
  is_ipv6_enabled     = true         # Enable IPv6 support
  default_root_object = "index.html" # Default root object to serve

  # Dynamic block to define logging configuration
  dynamic "logging_config" {
    for_each = var.logging_config
    content {
      include_cookies = logging_config.value.include_cookies # Include cookies in logs
      bucket          = logging_config.value.bucket          # S3 bucket for logs
      prefix          = logging_config.value.prefix          # Prefix for log files
    }
  }

  # Dynamic block to define default cache behavior
  dynamic "default_cache_behavior" {
    for_each = var.default_cache_behavior
    content {
      allowed_methods  = default_cache_behavior.value.allowed_methods  # Allowed HTTP methods
      cached_methods   = default_cache_behavior.value.cached_methods   # Methods to cache
      target_origin_id = default_cache_behavior.value.target_origin_id # Target origin ID for this cache behavior

      viewer_protocol_policy = default_cache_behavior.value.viewer_protocol_policy # Protocol policy for viewers
      min_ttl                = default_cache_behavior.value.min_ttl                # Minimum TTL for cached objects
      default_ttl            = default_cache_behavior.value.default_ttl            # Default TTL for cached objects
      max_ttl                = default_cache_behavior.value.max_ttl                # Maximum TTL for cached objects

      dynamic "forwarded_values" {
        for_each = var.forwarded_values
        content {
          query_string = forwarded_values.value.query_string # Forward query strings to origin
          cookies {
            forward = forwarded_values.value.forward # Forward cookies to origin
          }
        }
      }
    }
  }

  # Dynamic block to define ordered cache behaviors
  dynamic "ordered_cache_behavior" {
    for_each = var.ordered_cache_behavior
    content {
      path_pattern     = ordered_cache_behavior.value.path_pattern     # Path pattern for this cache behavior
      allowed_methods  = ordered_cache_behavior.value.allowed_methods  # Allowed HTTP methods
      cached_methods   = ordered_cache_behavior.value.cached_methods   # Methods to cache
      target_origin_id = ordered_cache_behavior.value.target_origin_id # Target origin ID for this cache behavior

      forwarded_values {
        query_string = ordered_cache_behavior.value.query_string # Forward query strings to origin
        headers      = ordered_cache_behavior.value.headers      # Forward headers to origin
        cookies {
          forward = ordered_cache_behavior.value.cookies_foward # Forward cookies to origin
        }
      }
      min_ttl                = ordered_cache_behavior.value.min_ttl                # Minimum TTL for cached objects
      default_ttl            = ordered_cache_behavior.value.default_ttl            # Default TTL for cached objects
      max_ttl                = ordered_cache_behavior.value.max_ttl                # Maximum TTL for cached objects
      compress               = ordered_cache_behavior.value.compress               # Enable compression
      viewer_protocol_policy = ordered_cache_behavior.value.viewer_protocol_policy # Protocol policy for viewers
    }
  }

  # Dynamic block to define geo restrictions
  dynamic "restrictions" {
    for_each = var.restrictions
    content {
      geo_restriction {
        restriction_type = restrictions.value.restriction_type # Type of geo restriction (e.g., whitelist, blacklist)
        locations        = restrictions.value.locations        # List of locations for the restriction
      }
    }
  }

  # Configure the viewer certificate
  viewer_certificate {
    cloudfront_default_certificate = var.cloudfront_default_certificate # Use the default CloudFront certificate
  }
}
