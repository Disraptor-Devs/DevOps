variable "environment" {
  description = "Environment name (e.g., staging, production)"
}

variable "stage" {
  description = "Stage of the environment (e.g., dev, admin)"
}

// Boolean variables to control the creation of CloudWatch alarms
variable "create_lambda_function1_alarm" {
  description = "Whether to create CloudWatch alarm for Lambda function 1"
  default     = false
}

variable "create_lambda_function2_alarm" {
  description = "Whether to create CloudWatch alarm for Lambda function 2"
  default     = false
}

variable "create_example" {
  type        = string
  description = "s3 bucket alarm"
}

variable "example_name" {
  type        = string
  description = "s3 alarm bucket name"
}

variable "create_documentdb_alarm" {
  description = "Whether to create CloudWatch alarm for DocumentDB"
  default     = false
}

variable "create_api_gateway_alarm" {
  description = "Whether to create CloudWatch alarm for API Gateway"
  default     = false
}

variable "create_backup_alarm" {
  description = "Whether to create CloudWatch alarm for AWS Backup"
  default     = false
}

variable "create_s3_alarm" {
  description = "Whether to create CloudWatch alarm for S3"
  default     = false
}
