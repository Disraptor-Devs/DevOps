variable "region" {
  description = "Specfies the region in which this resouce will be created in"
  type        = string
  default     = "af-south-1"
}

variable "firehose_role_name" {
  description = "Specify the name of the role created for the firehose iam role"
  type        = string
}

variable "is_s3_bucket" {
  description = "Specfies whether we need to create an S3 bucket for the S3 or Redshift consumers"
  type        = bool 
}

variable "is_s3_consumer" {
  description = "Specifies whether we need to create a stream to get data to our S3 consumer and if we need to just pass in the S3 values"
  type        = bool  
}


variable "is_redshift" {
  description = "Specifies whether we need to create a stream to get our data to our Redshift consumer"
  type        = bool 
}

variable "is_s3_extended_processing_config" {
  description = "Specifies whether we need to do further processing for the extended s3 consumer"
  type        = bool 
  
}

variable "firehose_delivery_stream_name" {
  description = "Specfies the name of the firehose delivery stream being created"
  type        = string 
}

variable "firehose_delivery_stream_destination" {
  description = "Specifies the destination of the firehose delivery stream (which is the consumer)"
  type        = string
}

