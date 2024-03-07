output "code_build_project_name" {
  description = "Code build project name"
  value       = aws_codebuild_project.code_build.name
}

output "code_build_role_arn" {
  description = "Code build role arn"
  value       = aws_codebuild_project.code_build.arn
}

output "code_build_id" {
  description = "Code build id"
  value       = aws_codebuild_project.code_build.id
}