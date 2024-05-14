variable "environment" {
  description = "Environment name (e.g., staging, production)"
}

variable "stage" {
  description = "Stage of the environment (e.g., dev, admin)"
}

variable "log_retention_days" {
  description = "Retention period for CloudWatch log groups (in days)"
  default     = 14
}

// Boolean variables to control the creation of CloudWatch log groups
variable "create_lambda_logs_function1" {
  description = "Whether to create CloudWatch log group for Lambda function 1"
  default     = false
}

variable "create_lambda_logs_function2" {
  description = "Whether to create CloudWatch log group for Lambda function 2"
  default     = false
}

variable "create_documentdb_logs" {
  description = "Whether to create CloudWatch log group for DocumentDB"
  default     = false
}

variable "create_api_gateway_logs" {
  description = "Whether to create CloudWatch log group for API Gateway"
  default     = false
}

variable "create_backup_logs" {
  description = "Whether to create CloudWatch log group for AWS Backup"
  default     = false
}

variable "create_s3_logs" {
  description = "Whether to create CloudWatch log group for S3"
  default     = false
}
