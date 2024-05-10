output "ecr_repo_id" {
  description = "The ID of the ECR repository"
  value = aws_ecr_repository.my_ecr_repository.registry_id
}

output "ecr_repo_url" {
  description = "The URL of the ECR repository"
  value = aws_ecr_repository.my_ecr_repository.repository_url
}

output "ecr_repo_name" {
  description = "The name of the ECR repository"
  value = aws_ecr_repository.my_ecr_repository.name
}

output "ecr_repo_arn" {
  description = "The ARN of the ECR repository"
  value = aws_ecr_repository.my_ecr_repository.arn
}