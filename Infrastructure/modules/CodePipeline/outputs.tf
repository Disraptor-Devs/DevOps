output "pipeline_name" {
  description = "Code pipeline name"
  value       = aws_codepipeline.code_pipeline.name
}

output "pipleine_arn" {
  description = "Code pipeline arn"
  value       = aws_codepipeline.code_pipeline.arn 
}

output "pipeline_id" {
  description = "Code pipeline id"
  value       = aws_codepipeline.code_pipeline.id
}