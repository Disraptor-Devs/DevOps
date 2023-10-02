output "lambda_alias_arn" {
  description = "Output the Lambda Alias arn"
  value       = aws_lambda_alias.lambda_alias.arn 
}

output "lambda_alias_id" {
  description = "Output the Lambda Alias id"
  value       = aws_lambda_alias.lambda_alias.id 
}

output "lambda_alias_name" {
  description = "Output the Lambda Alias qualifying name"
  value       = aws_lambda_alias.lambda_alias.name 
}

output "lambda_function_arn" {
  description = "Output the Lambda Function arn"
  value       = aws_lambda_function.lambda_function.arn 
}

output "lambda_function_id" {
  description = "Output the Lambda Function id"
  value       = aws_lambda_function.lambda_function.id 
}

output "lambda_function_name" {
  description = "Output the Lambda Function name"
  value       = aws_lambda_function.lambda_function.function_name   
}

output "event_source_kinesis_state" {
  description = "Output the event source mapping for Kinesis' current state"
  value       = var.is_kinesis_event_source ? aws_lambda_event_source_mapping.event_source_kinesis[0].state : null 
}

output "event_source_msk_state" {
  description = "Output the event source mapping for MSK's current state"
  value       = var.is_msk_cluster_event_source ? aws_lambda_event_source_mapping.event_source_msk[0].state : null 
}
