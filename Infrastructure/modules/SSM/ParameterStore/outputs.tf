output "ssm_paramater_arn" {
  description = "Output the SSM Parameter arn"
  value = {
    for key, ssm_parameter in aws_ssm_parameter.secret :
    key => ssm_parameter.arn
  }
}

output "ssm_paramter_value" {
  description = "Output the SSM parameter value for the sake of being imported by other modules"
  value       = var.is_get_value ? data.aws_ssm_parameter.getSecret[0].value : null
}

output "ssm_paramter_value_by_path" {
  description = "Output the SSM parameter value by path provided"
  value       = var.is_get_value_by_path ? data.aws_ssm_parameters_by_path.getSecretByPath[0].values : null
}