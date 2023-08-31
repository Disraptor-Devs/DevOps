output "ssm_paramater_arn" {
  description = "Output the SSM Parameter arn"
  value       = aws_ssm_parameter.secret.arn
}

output "ssm_paramter_value" {
  description = "Output the SSM parameter value for the sake of being imported by other modules"
  value       = data.aws_ssm_parameter.getSecret[0].value
}

output "ssm_paramter_value_by_path" {
  description = "Output the SSM parameter value by path provided"
  value       = data.aws_ssm_parameters_by_path.getSecretByPath[0].values

}