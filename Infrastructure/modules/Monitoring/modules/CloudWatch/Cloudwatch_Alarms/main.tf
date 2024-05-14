// Lambda Function 1 CloudWatch Alarm
// Data source to fetch information about existing Lambda functions
data "aws_lambda_function" "function1" {
  function_name = "existing_lambda_function_name1"
}

data "aws_lambda_function" "function2" {
  function_name = "existing_lambda_function_name2"
}

// Lambda Function 1 CloudWatch Alarm
resource "aws_cloudwatch_metric_alarm" "lambda_function1_alarm" {
  count               = var.create_lambda_function1_alarm ? 1 : 0
  alarm_name          = var.create_lambda_function1_alarm ? "${var.environment}-${var.stage}-lambda_function1_error_alarm" : null
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = 1
  metric_name         = "Errors"
  namespace           = "AWS/Lambda"
  period              = 300  // 5 minutes
  statistic           = "Sum"
  threshold           = 1
  alarm_description   = "Alarm when the number of errors in Lambda function 1 exceeds 1"
  alarm_actions       = var.create_lambda_function1_alarm ? ["ARN_of_SNS_Topic_to_notify_admin_and_dev"] : []
  dimensions          = var.create_lambda_function1_alarm ? { FunctionName = data.aws_lambda_function.function1.arn } : null
}

// Lambda Function 2 CloudWatch Alarm
resource "aws_cloudwatch_metric_alarm" "lambda_function2_alarm" {
  count               = var.create_lambda_function2_alarm ? 1 : 0
  alarm_name          = var.create_lambda_function2_alarm ? "${var.environment}-${var.stage}-lambda_function2_error_alarm" : null
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = 1
  metric_name         = "Errors"
  namespace           = "AWS/Lambda"
  period              = 300  // 5 minutes
  statistic           = "Sum"
  threshold           = 1
  alarm_description   = "Alarm when the number of errors in Lambda function 2 exceeds 1"
  alarm_actions       = var.create_lambda_function2_alarm ? ["ARN_of_SNS_Topic_to_notify_admin_and_dev"] : []
  dimensions          = var.create_lambda_function2_alarm ? { FunctionName = data.aws_lambda_function.function2.arn } : null
}


// DocumentDB CloudWatch Alarm
resource "aws_cloudwatch_metric_alarm" "documentdb_alarm" {
  count               = var.create_documentdb_alarm ? 1 : 0
  alarm_name          = var.create_documentdb_alarm ? "${var.environment}-${var.stage}-documentdb_error_alarm" : null
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = 1
  metric_name         = "FreeStorageSpace"
  namespace           = "AWS/DocumentDB"
  period              = 3600  // 1 hour
  statistic           = "Minimum"
  threshold           = 1000000000  // 1GB
  alarm_description   = "Alarm when free storage space in DocumentDB drops below 1GB"
  alarm_actions       = var.create_documentdb_alarm ? ["ARN_of_SNS_Topic_to_notify_admin_and_dev"] : []
}

resource "aws_s3_bucket" "example" {
  count = var.create_example ? 1 : 0
  bucket = var.example_name
  
}
// API Gateway CloudWatch Alarm
resource "aws_cloudwatch_metric_alarm" "api_gateway_alarm" {
  count               = var.create_api_gateway_alarm ? 1 : 0
  alarm_name          = var.create_api_gateway_alarm ? "${var.environment}-${var.stage}-api_gateway_error_alarm" : null
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = 1
  metric_name         = "5XXError"
  namespace           = "AWS/ApiGateway"
  period              = 300  // 5 minutes
  statistic           = "Sum"
  threshold           = 1
  alarm_description   = "Alarm when the number of 5XX errors in API Gateway exceeds 1"
  alarm_actions       = var.create_api_gateway_alarm ? ["ARN_of_SNS_Topic_to_notify_admin_and_dev"] : []
}

// AWS Backup CloudWatch Alarm
resource "aws_cloudwatch_metric_alarm" "backup_alarm" {
  count               = var.create_backup_alarm ? 1 : 0
  alarm_name          = var.create_backup_alarm ? "${var.environment}-${var.stage}-aws_backup_error_alarm" : null
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = 1
  metric_name         = "BackupJobErrors"
  namespace           = "AWS/Backup"
  period              = 3600  // 1 hour
  statistic           = "Sum"
  threshold           = 1
  alarm_description   = "Alarm when the number of backup job errors in AWS Backup exceeds 1"
  alarm_actions       = var.create_backup_alarm ? ["ARN_of_SNS_Topic_to_notify_admin_and_dev"] : []
}

// S3 CloudWatch Alarm
resource "aws_cloudwatch_metric_alarm" "s3_alarm" {
  count               = var.create_s3_alarm ? 1 : 0
  alarm_name          = var.create_s3_alarm ? "${var.environment}-${var.stage}-s3_error_alarm" : null
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = 1
  metric_name         = "BucketSizeBytes"
  namespace           = "AWS/S3"
  period              = 3600  // 1 hour
  statistic           = "Average"
  threshold           = 1073741824  // 1GB
  alarm_description   = "Alarm when the size of the S3 bucket exceeds 1GB"
  alarm_actions       = var.create_s3_alarm ? ["ARN_of_SNS_Topic_to_notify_admin_and_dev"] : []
  dimensions          = var.create_s3_alarm ? { BucketName = aws_s3_bucket.example[0].bucket } : null
}
