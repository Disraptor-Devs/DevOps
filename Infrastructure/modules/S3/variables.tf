variable "region" {
  description = "Specfies the region in which this resouce will be created in"
  type        = string
  default     = "af-south-1"
}

variable "s3_bucket_name" {
  description = "Specifies the name of the bucket being created"
  type        = string
  
}

variable "s3_bucket_versioning" {
  description = "Specifies whether bucket versioning will be enabled or not"
  type        = string
  default     = "Enabled"
}

variable "s3_bucket_acl" {
  description = "Specifies whether the s3 bucket will be private or public-facing"
  type        = string
  default     = "private"
}

variable "s3_tags" {
  description = "Specify the tags (key, value pairs) to be associated with the S3 bucket"
  type        = map(string) 
}

variable "s3_policy_actions" {
  description = "Specify a list of actions to attach to the s3 bucket policy"
  type        = list(string)
}

variable "is_logging_bucket" {
  description = "Specifies whether we need to create a logging bucket for the main bucket being created"
  type        = bool
  default     = false 
}

variable "target_prefix" {
  description = "Specifies the target prefix for the logging bucket"
  type        = string 
  default     = "log/"
}

variable "sns_topic_arn" {
  description = "Specifies the SNS topic arn if bucket notification is enabled"
  type        = string
  default     = "" 
}

variable "s3_bucket_notification_events" {
  description = "Specifies the events we want to be notified off on the created S3 bucket"
  type        = list(string)
  default     = [ "" ]
}


variable "object_ownership" {
  description = "Specify the Object ownership for the S3 being created"
  type        = string 
  default     = "BucketOwnerPreferred"
}