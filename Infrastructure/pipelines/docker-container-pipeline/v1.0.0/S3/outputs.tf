output "s3_bucket_id" {
  description = "Value for the S3 bucket id"
  value       = aws_s3_bucket.s3_bucket.id
}

output "s3_bucket_name" {
  description = "Value for the S3 bucket name"
  value       = aws_s3_bucket.s3_bucket.bucket

}

output "s3_bucket_arn" {
  description = "Value for the S3 bucket arn"
  value       = aws_s3_bucket.s3_bucket.arn

}

output "kms_key_id" {
  description = "Value for the KMS key id"
  value       = aws_kms_key.bucket_kms_key.id
  sensitive   = true


}

