output "s3_cloudfront_logging_bucket" {
  description = "The endpoint for the S3 bucket used for CloudFront logging, formatted as bucket-name.s3.amazonaws.com"
  value       = "${aws_s3_bucket.cloudwatch_logs_bucket.bucket}.s3.amazonaws.com"
}

output "bucket_name" {
  description = "The name of the S3 bucket used for CloudFront logging"
  value       = aws_s3_bucket.cloudwatch_logs_bucket.bucket
}

output "bucket_arn" {
  description = "The Amazon Resource Name (ARN) of the S3 bucket used for CloudFront logging"
  value       = aws_s3_bucket.cloudwatch_logs_bucket.arn
}

output "bucket_id" {
  description = "The ID of the S3 bucket used for CloudFront logging"
  value       = aws_s3_bucket.cloudwatch_logs_bucket.id
}
