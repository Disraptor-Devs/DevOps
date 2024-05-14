output "s3_bucket_id" {
  description = "Output of the s3 bucket id to be used in other modules (if extended)"
  value       = aws_s3_bucket.s3_bucket.id
}

output "s3_bucket_arn" {
  description = "Output of the S3 bucket arn to be used in other modules (if extended)"
  value       = aws_s3_bucket.s3_bucket.arn
}

output "s3_bucket_path" {
  description = "Output of the S3 bucket path to be used in other modules (if extended)"
  value       = "s3://${aws_s3_bucket.s3_bucket.id}"
}

output "s3_bucket_url" {
  description = "Output of the S3 bucket region-specific URL"
  value = aws_s3_bucket.s3_bucket.bucket_regional_domain_name
}