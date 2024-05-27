output "cloudfront_origin_access_control_id" {
  description = "The unique identifier for the CloudFront Origin Access Control."
  value       = aws_cloudfront_origin_access_control.aws_cloudfront_origin_access_control.id
}

output "cloudfront_distribution_id" {
  description = "The unique identifier for the CloudFront Distribution. This ID can be used to perform various management operations on the distribution."
  value       = aws_cloudfront_distribution.cdn.id
}

output "cloudfront_distribution_arn" {
  description = "The Amazon Resource Name (ARN) of the CloudFront Distribution. This ARN can be used for IAM policies and other AWS service integrations."
  value       = aws_cloudfront_distribution.cdn.arn
}

output "cloudfront_domain_name" {
  description = "The domain name assigned to the CloudFront Distribution. Use this domain name to access your content through the CloudFront CDN."
  value       = aws_cloudfront_distribution.cdn.domain_name
}

output "cloudfront_etag" {
  description = "The ETag of the CloudFront Distribution. This value changes when the distribution configuration is updated, and can be used for cache invalidation and update operations."
  value       = aws_cloudfront_distribution.cdn.etag
}

output "cloudfront_status" {
  description = "The current status of the CloudFront Distribution. Possible values include 'Deployed' for an active distribution, or 'InProgress' for a distribution that is being created or updated."
  value       = aws_cloudfront_distribution.cdn.status
}

output "cloudfront_last_modified_time" {
  description = "The timestamp of the last modification made to the CloudFront Distribution. This can be useful for auditing and tracking changes."
  value       = aws_cloudfront_distribution.cdn.last_modified_time
}

output "cloudfront_enabled" {
  description = "A boolean value indicating whether the CloudFront Distribution is enabled. If true, the distribution is serving content; if false, it is disabled."
  value       = aws_cloudfront_distribution.cdn.enabled
}
