variable "region" {
  description = "The AWS region where the infrastructure will be deployed. Default is 'af-south-1'."
  type        = string
  default     = "af-south-1"
}

variable "cloudFront_logging_bucket_name" {
  description = "A unique name for the S3 bucket. This name must be globally unique and adhere to S3 bucket naming conventions."
  type        = string
}

variable "environment" {
  description = "the environment that you are working in, i.e. 'staging' or 'prod'"
  type        = string
}

variable "tag_name" {
  description = "A name for the 'Name' tag that will be applied to all resources. This helps in identifying and managing your resources."
  type        = string
}
