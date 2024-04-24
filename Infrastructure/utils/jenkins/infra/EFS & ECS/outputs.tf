output "efs_name" {
  description = "Value for the EFS name"
  value       = aws_efs_file_system.jenkins_fs.id
}

output "efs_arn" {
  description = "Value for the EFS arn"
  value       = aws_efs_file_system.jenkins_fs.arn
}

