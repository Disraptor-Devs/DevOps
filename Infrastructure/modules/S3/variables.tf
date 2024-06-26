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
  type        = set(string)
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
  default     = null
}

variable "s3_bucket_notification_events" {
  description = "Specifies the events we want to be notified off on the created S3 bucket"
  type        = set(string)
  default     = []
}

variable "s3_identifiers" {
  description = "Specifies the identifiers for the S3 bucket being created"
  type        = set(string)
  default     = ["*"]
}


variable "object_ownership" {
  description = "Specify the Object ownership for the S3 being created"
  type        = string
  default     = "ObjectWriter"
}

variable "is_lifecycle_policy" {
  description = "Specify whether to create and attach a lifecycle policy to the S3 bucket"
  type        = bool
  default     = false
}

variable "is_access_point" {
  description = "Specify whether we need to create an access point for our S3 bucket"
  type        = bool
  default     = false
}

variable "lifecycle_name" {
  description = "Specify name for the lifecycle config for the S3 bucket"
  type        = string
  default     = null
}

variable "lifecylce_status" {
  description = "Specify the status of the lifecycle "
  type        = string
  default     = "Disabled"
}

variable "lifecycle_transition_days" {
  description = "Specify the number of days to transition the bucket to a different class"
  type        = number
  default     = 0
}

variable "lifecycle_storage_class" {
  description = "Specify the storage class to transition to"
  type        = map(string)
  default     = {}
}

variable "is_bucket_notification" {
  description = "Specify whether we enable bucket notification"
  type        = bool
  default     = false

}

variable "object_path" {
  description = "Specify the path to the object"
  type        = string
  default     = null
}

variable "is_kms_encryption" {
  description = "Specify whether to enable KMS encryption for the S3 bucket"
  type        = bool
  default     = false
}

variable "is_block_public_acls" {
  description = "Specifies whether to block public ACLs for the S3 bucket"
  type        = bool
  default     = false
}

variable "is_block_public_policy" {
  description = "Specifies whether to block public policies for the S3 bucket"
  type        = bool
  default     = false

}

variable "is_ignore_public_acls" {
  description = "Specifies whether to ignore public ACLs for the S3 bucket"
  type        = bool
  default     = false
}

variable "is_restrict_public_buckets" {
  description = "Specifies whether to restrict public buckets for the S3 bucket"
  type        = bool
  default     = false
}

variable "is_public_access_block" {
  description = "Specifies whether to block public access for the S3 bucket"
  type        = bool
  default     = false

}

variable "is_s3_site_hosting" {
  description = "Specifies whether to enable S3 static website hosting"
  type        = bool
  default     = false
}

variable "s3_index_document" {
  description = "Specifies the index document for the S3 static website hosting"
  type        = string
  default     = "index.html"
}

# variable "s3_error_document" {
#   description = "Specifies the error document for the S3 static website hosting"
#   type        = string
#   default     = null
# }

variable "is_s3_routing_rules" {
  description = "Specifies whether to enable routing rules for the S3 static website hosting"
  type        = bool
  default     = false
}

variable "s3_routing_key_prefix_condition" {
  description = "Specifies the key prefix condition for the routing rule"
  type        = string
  default     = null
}

variable "s3_routing_replace_key_prefix_with" {
  description = "Specifies the key prefix to replace with"
  type        = string
  default     = null
}

variable "s3_site_protocol" {
  description = "Specifies the protocol for the S3 static website hosting"
  type        = string
  default     = "https"
}

variable "s3_site_hostname" {
  description = "Specifies the hostname for the S3 static website hosting"
  type        = string
  default     = null
}

variable "is_bucket_policy" {
  description = "Specifies whether to attach a bucket policy to the S3 bucket"
  type        = bool
  default     = true
}