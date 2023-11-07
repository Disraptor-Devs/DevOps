output "event_bridge_rule_arn" {
  description = "The ARN of the EventBridge rule"
  value       = aws_cloudwatch_event_rule.event_bridge.arn
}

output "event_bridge_rule_id" {
  description = "The ID of the EventBridge rule"
  value       = aws_cloudwatch_event_rule.event_bridge.id
}

output "event_bridge_bus_arn" {
  description = "The ARN of the EventBridge bus"
  value       = aws_cloudwatch_event_rule.event_bridge.arn
}

output "event_bridge_conection_arn" {
  description = "The ARN of the EventBridge connection"
  value       = var.eventBridge_is_connection ? aws_cloudwatch_event_connection.eventBridge_connection.arn : null
}

output "event_bridge_api_dest_arn" {
  description = "The ARN of the EventBridge api destination"
  value       = var.is_eventBridge_api_destination ? aws_cloudwatch_event_api_destination.api_dest.arn : null
}