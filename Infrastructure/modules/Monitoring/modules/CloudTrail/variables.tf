variable "environment" {
  description = "Environment name (e.g., staging, production)"
}

variable "stage" {
  description = "Stage of the environment (e.g., dev, admin)"
}

variable "create_cloudtrail" {
  description = "Whether to create CloudTrail"
  default     = false
}

variable "create_cloudtrail_bucket" {
  description = "Whether to create S3 bucket for CloudTrail"
  default     = false
}

variable "create_s3_bucket_logging" {
  description = "Whether to create S3 bucket for CloudTrail logging"
  default     = false
}

variable "cloudtrail_bucket_name" {
  description = "Name of the S3 bucket for CloudTrail"
  default     = "my-cloudtrail-bucket"
}

variable "cloudtrail_name" {
  description = "Name of the CloudTrail"
  default     = "my-cloudtrail"
}

variable "s3_bucket_logging_name" {
  description = "Name of the S3 bucket for CloudTrail logging"
  default     = "my-cloudtrail-logging"
}

variable "backend_bucket" {
  description = "The name of the S3 bucket to store the Terraform state file"
  type        = string
  default     = "disraptor-terraform-state"
}

variable "terraform_state_key" {
  description = "The path to the Terraform state file in the S3 bucket"
  type        = string
}

variable "dynamodb_lock_table" {
  description = "The name of the DynamoDB table to use for Terraform state locking"
  type        = string
}

variable "region" {
  description = "The region in which the resources will be created"
  type        = string
  default     = "eu-central-1"
}
