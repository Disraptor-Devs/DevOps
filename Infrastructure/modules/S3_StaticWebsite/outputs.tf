output "bucket_name" {
  description = "The name of the S3 bucket"
  value       = aws_s3_bucket.website_hosting.bucket
}

output "bucket_arn" {
  description = "The ARN of the S3 bucket"
  value       = aws_s3_bucket.website_hosting.arn
}

output "bucket_website_endpoint" {
  description = "The website endpoint of the S3 bucket"
  value       = aws_s3_bucket.website_hosting.website_endpoint
}

output "bucket_region" {
  description = "The AWS region where the S3 bucket is created"
  value       = aws_s3_bucket.website_hosting.region
}

output "bucket_policy" {
  description = "The JSON representation of the S3 bucket policy"
  value       = aws_s3_bucket_policy.website_bucket_policy.policy
}

output "bucket_domain_name" {
  description = "The domain name of the S3 bucket"
  value       = aws_s3_bucket.website_hosting.bucket_domain_name
}

output "bucket_id" {
  description = "The ID of the S3 bucket"
  value       = aws_s3_bucket.website_hosting.id
}

output "public_access_block" {
  description = "Public access block configuration for the S3 bucket"
  value       = aws_s3_bucket_public_access_block.s3_bucket_public_access_block
}
