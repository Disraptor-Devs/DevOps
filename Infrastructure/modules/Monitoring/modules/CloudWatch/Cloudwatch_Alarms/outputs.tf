output "lambda_function1_alarm_arn" {
  value = aws_cloudwatch_metric_alarm.lambda_function1_alarm[0].arn
}

output "lambda_function1_alarm_name" {
  value = aws_cloudwatch_metric_alarm.lambda_function1_alarm[0].alarm_name
}

output "lambda_function1_alarm_description" {
  value = aws_cloudwatch_metric_alarm.lambda_function1_alarm[0].alarm_description
}



output "lambda_function2_alarm_description" {
  value = aws_cloudwatch_metric_alarm.lambda_function2_alarm[0].alarm_description
}

output "documentdb_alarm_arn" {
  value = aws_cloudwatch_metric_alarm.documentdb_alarm[0].arn
}

output "documentdb_alarm_name" {
  value = aws_cloudwatch_metric_alarm.documentdb_alarm[0].alarm_name
}

output "documentdb_alarm_description" {
  value = aws_cloudwatch_metric_alarm.documentdb_alarm[0].alarm_description
}

output "api_gateway_alarm_arn" {
  value = aws_cloudwatch_metric_alarm.api_gateway_alarm[0].arn
}

output "api_gateway_alarm_name" {
  value = aws_cloudwatch_metric_alarm.api_gateway_alarm[0].alarm_name
}

output "api_gateway_alarm_description" {
  value = aws_cloudwatch_metric_alarm.api_gateway_alarm[0].alarm_description
}

output "backup_alarm_arn" {
  value = aws_cloudwatch_metric_alarm.backup_alarm[0].arn
}

output "backup_alarm_name" {
  value = aws_cloudwatch_metric_alarm.backup_alarm[0].alarm_name
}

output "backup_alarm_description" {
  value = aws_cloudwatch_metric_alarm.backup_alarm[0].alarm_description
}

output "s3_alarm_arn" {
  value = aws_cloudwatch_metric_alarm.s3_alarm[0].arn
}

output "s3_alarm_name" {
  value = aws_cloudwatch_metric_alarm.s3_alarm[0].alarm_name
}

output "s3_alarm_description" {
  value = aws_cloudwatch_metric_alarm.s3_alarm[0].alarm_description
}
