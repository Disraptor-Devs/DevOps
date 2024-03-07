output "metric_alarm_arn" {
  description = "The ARN of the metric alarm"
  value       = aws_cloudwatch_metric_alarm.metric_alarm.arn
}

output "metric_stream_arn" {
  description = "The ARN of the metric stream"
  value       = aws_cloudwatch_metric_stream.metric_stream.arn
}

output "composite_alarm_arn" {
  description = "The ARN of the composite alarm"
  value       = var.is_create_composite_alarm ? aws_cloudwatch_composite_alarm.composite_alarm[0].arn : null

}