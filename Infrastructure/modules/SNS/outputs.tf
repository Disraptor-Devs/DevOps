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

output "sns_firehose_subscription_arn" {
  description = "Output the SNS firehose subscription arn"
  value       = aws_sns_topic_subscription.subscription_for_firehose[0].arn
}

output "sns_firehose_subscription_endpoint" {
  description = "Output the SNS firehose subscription endpoint"
  value       = aws_sns_topic_subscription.subscription_for_firehose[0].endpoint
}

output "sns_application_subscription_arn" {
  description = "Output the SNS application subscription arn"
  value       = aws_sns_topic_subscription.subscription_for_application[0].arn
}

output "sns_application_subscription_endpoint" {
  description = "Output the SNS application subscription endpoint"
  value       = aws_sns_topic_subscription.subscription_for_application[0].endpoint
}

output "sns_email_subscription_arn" {
  description = "Output the SNS email subscription arn"
  value       = aws_sns_topic_subscription.subscription_for_email[0].arn
}

output "sns_email_subscription_endpoint" {
  description = "Output the SNS email subscription endpoint"
  value       = aws_sns_topic_subscription.subscription_for_email[0].endpoint
}

output "sns_lambda_subscription_arn" {
  description = "Output the SNS email subscription arn"
  value       = aws_sns_topic_subscription.subscription_for_lambda[0].arn
}

output "sns_lambda_subscription_endpoint" {
  description = "Output the SNS lambda subscription endpoint"
  value       = aws_sns_topic_subscription.subscription_for_lambda[0].endpoint
}
