// Data source to fetch information about existing Lambda functions
data "aws_lambda_function" "function1" {
  count         = var.create_lambda_logs_function1 ? 1 : 0
  function_name = var.create_lambda_logs_function1 ? "existing_lambda_function_name1" : null
}

data "aws_lambda_function" "function2" {
  count         = var.create_lambda_logs_function2 ? 1 : 0
  function_name = var.create_lambda_logs_function2 ? "existing_lambda_function_name2" : null
}

// Lambda Function 1 CloudWatch Log Group
resource "aws_cloudwatch_log_group" "lambda_logs_function1" {
  count             = var.create_lambda_logs_function1 ? 1 : 0
  name              = var.create_lambda_logs_function1 ? "/aws/lambda/${var.environment}-${var.stage}-${data.aws_lambda_function.function1[0].function_name}" : null
  retention_in_days = var.log_retention_days
}

// Lambda Function 2 CloudWatch Log Group
resource "aws_cloudwatch_log_group" "lambda_logs_function2" {
  count             = var.create_lambda_logs_function2 ? 1 : 0
  name              = var.create_lambda_logs_function2 ? "/aws/lambda/${var.environment}-${var.stage}-${data.aws_lambda_function.function2[0].function_name}" : null
  retention_in_days = var.log_retention_days
}


// DocumentDB CloudWatch Log Group
resource "aws_cloudwatch_log_group" "documentdb_logs" {
  count             = var.create_documentdb_logs ? 1 : 0
  name              = var.create_documentdb_logs ? "/aws/documentdb" : null
  retention_in_days = var.log_retention_days
}

// API Gateway CloudWatch Log Group
resource "aws_api_gateway_account" "main" {}

resource "aws_cloudwatch_log_group" "api_gateway_logs" {
  count             = var.create_api_gateway_logs ? 1 : 0
  name              = var.create_api_gateway_logs ? "/aws/api-gateway/${var.environment}-${var.stage}-${aws_api_gateway_account.main.id}" : null
  retention_in_days = var.log_retention_days
}

// AWS Backup CloudWatch Log Group
resource "aws_cloudwatch_log_group" "backup_logs" {
  count             = var.create_backup_logs ? 1 : 0
  name              = var.create_backup_logs ? "/aws/backup" : null
  retention_in_days = var.log_retention_days
}

// S3 CloudWatch Log Group
resource "aws_s3_bucket" "example" {
  count   = var.create_s3_logs ? 1 : 0
  bucket  = var.create_s3_logs ? "example-bucket" : null
  // Other bucket properties...
}

resource "aws_cloudwatch_log_group" "s3_logs" {
  count             = var.create_s3_logs ? 1 : 0
  name              = var.create_s3_logs ? "/aws/s3/${var.environment}-${var.stage}-${aws_s3_bucket.example[0].id}" : null
  retention_in_days = var.log_retention_days
}
