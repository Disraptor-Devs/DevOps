variable "cloudfront_access_control_name" {
  description = "A unique name that identifies the CloudFront Origin Access Control."
  type        = string
}

variable "cloudfront_access_control_description" {
  description = "The description of the CloudFront Origin Access Control. Defaults to 'This is used to log the website into the S3 bucket which is enabled for logging' if omitted."
  type        = string
  default     = "This is used to log the website into the S3 bucket which is enabled for logging"
}

variable "region" {
  description = "The AWS region where the infrastructure will be deployed. The default region is 'af-south-1'."
  type        = string
  default     = "af-south-1"
}

variable "website_bucket" {
  description = "The name of the S3 bucket that will host the website content."
  type        = string
}

variable "s3_cloudfront_logging_bucket" {
  description = "The S3 bucket used for logging CloudFront access logs. It should be formatted as 'bucket-name.s3.amazonaws.com'."
  type        = string
}

variable "prefix_value" {
  description = "Prefix value for CloudFront logging to help organize logs within the logging bucket. Do not include a trailing '/'. The default prefix is 'cloudfront-logging'."
  type        = string
  default     = "cloudfront-logging"
}

variable "environment" {
  description = "The environment where the infrastructure is deployed, such as 'staging' or 'prod'."
  type        = string
}

variable "tag_name" {
  description = "A name for the 'Name' tag that will be applied to all resources. This helps in identifying and managing your resources."
  type        = string
}
