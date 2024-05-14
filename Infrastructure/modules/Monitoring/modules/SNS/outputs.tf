output "admin_topic_arn" {
  value = aws_sns_topic.admin_topic.arn
}

output "admin_topic_name" {
  value = aws_sns_topic.admin_topic.name
}

output "dev_topic_arn" {
  value = aws_sns_topic.dev_topic.arn
}

output "dev_topic_name" {
  value = aws_sns_topic.dev_topic.name
}
