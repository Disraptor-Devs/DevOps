output "repository_id" {
  description = "Code commit repository name"
  value       = data.aws_codecommit_repository.repository.repository_id
}

output "repository_arn" {
  description = "Code commit repository branch name"
  value       = data.aws_codecommit_repository.repository.arn
}
