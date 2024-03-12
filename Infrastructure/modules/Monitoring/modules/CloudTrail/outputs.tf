output "cloudtrail_default_name" {
  value = aws_cloudtrail.default[0].name
}

output "cloudtrail_default_arn" {
  value = aws_cloudtrail.default[0].arn
}

output "cloudtrail_default_s3_bucket_name" {
  value = aws_cloudtrail.default[0].s3_bucket_name
}

output "cloudtrail_s3_bucket_logging_name" {
  value = aws_cloudtrail.s3_bucket_logging[0].name
}

output "cloudtrail_s3_bucket_logging_arn" {
  value = aws_cloudtrail.s3_bucket_logging[0].arn
}

output "cloudtrail_s3_bucket_logging_s3_bucket_name" {
  value = aws_cloudtrail.s3_bucket_logging[0].s3_bucket_name
}
