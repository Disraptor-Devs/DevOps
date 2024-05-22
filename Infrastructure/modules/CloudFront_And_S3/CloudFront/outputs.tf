output "cloudfront_distribution_id" {
  description = "The ID of the CloudFront distribution"
  value       = aws_cloudfront_distribution.cdn.id
}

output "cloudfront_distribution_arn" {
  description = "The ARN of the CloudFront distribution"
  value       = aws_cloudfront_distribution.cdn.arn
}

output "cloudfront_distribution_domain_name" {
  description = "The domain name of the CloudFront distribution"
  value       = aws_cloudfront_distribution.cdn.domain_name
}

output "cloudfront_distribution_status" {
  description = "The status of the CloudFront distribution"
  value       = aws_cloudfront_distribution.cdn.status
}

output "s3_origin_id" {
  description = "The ID of the S3 origin for the CloudFront distribution"
  value       = local.s3_origin_id
}

output "cloudfront_origin_access_control_id" {
  description = "The ID of the CloudFront origin access control"
  value       = aws_cloudfront_origin_access_control.aws_cloudfront_origin_access_control.id
}

output "cloudfront_origin_access_control_name" {
  description = "The name of the CloudFront origin access control"
  value       = aws_cloudfront_origin_access_control.aws_cloudfront_origin_access_control.name
}

output "s3_bucket_regional_domain_name" {
  description = "The regional domain name of the S3 bucket used as the origin for CloudFront"
  value       = data.aws_s3_bucket.website_bucket.bucket_regional_domain_name
}
