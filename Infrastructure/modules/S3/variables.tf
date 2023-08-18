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