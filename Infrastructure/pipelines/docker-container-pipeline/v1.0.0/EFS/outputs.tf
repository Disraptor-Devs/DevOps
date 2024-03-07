output "efs_name" {
  description = "Value for the EFS name"
  value       = aws_efs_file_system.jenkins_fs.id
}

output "efs_arn" {
  description = "Value for the EFS arn"
  value       = aws_efs_file_system.jenkins_fs.arn
}

output "kms_key_id" {
  description = "Value for the KMS key id"
  value       = aws_kms_key.jenkins_fs_key.id
  sensitive   = true
}

