variable "region" {
  description = "Specfies the region in which this resouce will be created in"
  type        = string
  default     = "af-south-1"
}

variable "firehose_role_name" {
  description = "Specify the name of the role created for the firehose iam role"
  type        = string
}

variable "is_s3_existing_bucket" {
  description = "Specfies whether we need to create an S3 bucket for the S3 or Redshift consumers or we just pass in values"
  type        = bool
  default     = false 
}

variable "is_s3_consumer" {
  description = "Specifies whether we need to create a stream to get data to our S3 consumer and if we need to just pass in the S3 values"
  type        = bool
  default     = false  
}


variable "is_redshift_consumer" {
  description = "Specifies whether we need to create a stream to get our data to our Redshift consumer"
  type        = bool 
  default     = false
}

variable "is_kinesis_consumer" {
  description = "Specifies whether we need to create a stream to get our data to our Kinesis stream consumer"
  type        = bool 
  default     = false  
}

variable "is_s3_extended_processing_config" {
  description = "Specifies whether we need to do further processing for the extended s3 consumer"
  type        = bool
  default     = false 
}

variable "firehose_delivery_stream_name" {
  description = "Specfies the name of the firehose delivery stream being created"
  type        = string 
}

variable "firehose_delivery_stream_destination" {
  description = "Specifies the destination of the firehose delivery stream (which is the consumer)"
  type        = string
}

variable "kdf_tags" {
  description = "value"
  type        = map(string)
}

variable "s3_bucket_name" {
  description = "Specifies name for the s3 bucket"
  type        = string 
  default     = ""
}


variable "s3_policy_actions" {
  description = "Specifies the policy actions for the S3 bucket being created"
  type        = list(string)
  default     = [ "" ]   
}

variable "passed_in_s3_bucket_arn" {
  description = "Specifies the arn of an existing S3 bucket that will be used by this module"
  type        =  string
  default     = ""
  
}

variable "redshift_cluster_identifier" {
  description = "Specify the indentifier for an exisitng Redshift cluster that's been created"
  type        = string
}