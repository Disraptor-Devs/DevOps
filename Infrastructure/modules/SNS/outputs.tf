output "sns_topic_arn" {
  description = "Output the arn of the created SNS topic"
  value       = aws_sns_topic.sns_topic.arn  
}

output "sns_topic_name" {
  description = "Output the name of the created SNS topic"
  value       = aws_sns_topic.sns_topic.name 
}

output "sns_topic_id" {
  description = "Output the id of the created SNS topic"  
  value       = aws_sns_topic.sns_topic.id
}

output "sns_firehose_consumer_arn" {
  description = "Output the SNS consumer arn"
  value       = aws_sns_topic_subscription.subscription_for_firehose[0].arn
}

output "sns_firehose_consumer_endpoint" {
  description = "Output the SNS consumer endpoint"
  value       = aws_sns_topic_subscription.subscription_for_firehose[0].endpoint
}