output "code_deploy_app_name" {
  description = "Code deploy app name"
  value       = aws_codedeploy_app.code_deploy_app.name
}

output "code_deplo_app_id" {
  description = "Code deploy app id"
  value       = aws_codedeploy_app.code_deploy_app.id
}

output "code_deploy_app_arn" {
  description = "Code deploy app arn"
  value       = aws_codedeploy_app.code_deploy_app.arn
}

output "deployment_group_name" {
  description = "Deployment group name"
  value       = aws_codedeploy_deployment_group.deployment_group.deployment_group_name
}

output "deployment_group_id" {
  description = "Deployment group id"
  value       = aws_codedeploy_deployment_group.deployment_group.id
}

output "deployment_group_arn" {
  description = "Deployment group arn"
  value       = aws_codedeploy_deployment_group.deployment_group.arn

}