output "lambda_function1_log_group_arn" {
  value = aws_cloudwatch_log_group.lambda_logs_function1[0].arn
}

output "lambda_function1_log_group_name" {
  value = aws_cloudwatch_log_group.lambda_logs_function1[0].name
}

output "lambda_function2_log_group_arn" {
  value = aws_cloudwatch_log_group.lambda_logs_function2[0].arn
}

output "lambda_function2_log_group_name" {
  value = aws_cloudwatch_log_group.lambda_logs_function2[0].name
}

output "documentdb_log_group_arn" {
  value = aws_cloudwatch_log_group.documentdb_logs[0].arn
}

output "documentdb_log_group_name" {
  value = aws_cloudwatch_log_group.documentdb_logs[0].name
}

output "api_gateway_log_group_arn" {
  value = aws_cloudwatch_log_group.api_gateway_logs[0].arn
}

output "api_gateway_log_group_name" {
  value = aws_cloudwatch_log_group.api_gateway_logs[0].name
}

output "backup_log_group_arn" {
  value = aws_cloudwatch_log_group.backup_logs[0].arn
}

output "backup_log_group_name" {
  value = aws_cloudwatch_log_group.backup_logs[0].name
}

output "s3_log_group_arn" {
  value = aws_cloudwatch_log_group.s3_logs[0].arn
}

output "s3_log_group_name" {
  value = aws_cloudwatch_log_group.s3_logs[0].name
}
