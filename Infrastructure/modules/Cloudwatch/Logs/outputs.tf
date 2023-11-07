output "log_group_arn" {
  description = "The ARN of the log group"
  value       = aws_cloudwatch_log_group.log_group.arn
}

output "log_stream_arn" {
  description = "The ARN of the log stream"
  value       = var.is_log_stream ? aws_cloudwatch_log_stream.log_stream.arn : null
}

output "log_metric_filter_id" {
  description = "The ID of the log metric filter"
  value       = var.is_log_metric_filter ? aws_cloudwatch_log_metric_filter.metric_filter.id : null
}

output "log_destination_arn" {
  description = "The ARN of the log destination"
  value       = var.is_log_destination ? aws_cloudwatch_log_destination.cw_log_destination.arn : null
}