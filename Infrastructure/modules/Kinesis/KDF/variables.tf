variable "region" {
  description = "Specfies the region in which this resouce will be created in"
  type        = string
  default     = "af-south-1"
}

variable "firehose_role_name" {
  description = "Specify the name of the role created for the firehose iam role"
  type        = string
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
  description = "Specify the tags to assign to the KDH delivery streams that are created"
  type        = map(string)
}


variable "passed_in_s3_bucket_arn" {
  description = "Specifies the arn of an existing S3 bucket that will be used by this module"
  type        = string
  default     = ""
}

variable "redshift_data_table_columns" {
  description = "Specify the redshift data table columns"
  type        = string
  default     = ""
}

variable "redshift_data_table_name" {
  description = "Specify the redshift data table name"
  type        = string
  default     = "" 

}

variable "redshift_delimiter" {
  description = "Specify the default delimiter"
  type        = string
  default     = "delimiter '|'"
}

variable "is_delivery_start_config_earliest" {
  description = "Specify if the delivery start time of the s"
  type        = bool
  default     = false
}

variable "is_encryption_config" {
  description = "Specify if we will provide encryption for the delivery stream for Kinesis"
  type        = bool
  default     = false
}


variable "kinesis_stream_buffer_size" {
  description = "Specify the buffer size for the delivery stream for Kinesis in seconds"
  type        = number
  default     = 0
}

variable "kinesis_stream_buffer_interval" {
  description = "Specify the buffer interval for the delivery stream for Kinesis in seconds"
  type        = number
  default     = 0
}

variable "s3_buffering_size" {
  description = "Specify the buffering size for the S3 config for the redshift stream"
  type        = number
  default     = 10
}

variable "s3_buffering_interval" {
  description = "Specify the buffering interval for the S3 config for the redshift stream"
  type        = number
  default     = 400
}

variable "s3_compression_format" {
  description = "Specify the compression format for the S3 config for the redshift stream"
  type        = string
  default     = "GZIP"
}

variable "error_output_prefix" {
  description = "Specify the Error prefix for the extended S3 configuration"
  type        = string
  default     = "error-"
}

variable "extended_s3_buffer_size" {
  description = "Specify the buffer size for the extended S3 configuration"
  type        = number
  default     = 0
}

variable "is_cloudwatch_logging" {
  description = "Specify whether we enable cloud watch logging for the redshift and extended s3 streams"
  type        = bool
  default     = false
}

variable "log_group_name" {
  description = "Specify the log group name if cloudwatch logging has been enabled"
  type        = string
  default     = ""
}

variable "log_stream_name" {
  description = "Specify the log stream name of the cloudwatch logging has been enabled"
  type        = string
  default     = ""
}

variable "lambda_processor_arn" {
  description = "Specify The lambda processor arn for the extended S3 configuration if process configuration has been enabled"
  type        = string
  default     = ""
}

variable "kinesis_stream_arn" {
  description = "specify the kinesis stream arn to be procided in the extended s3 config"
  type        = string
  default     = "" 
}

variable "s3_processors" {
  description = "Specify the processor for the extended S3 config"
  type        = string
  default     = "Lambda" 
}

variable "redshift_usernmae" {
  description = "Specify the value of the redshift username for the reshift config"
  type        = string
  default     = "" 
}

variable "redshift_passw" {
  description = "Specify the value of the redshift password to be used for the redshift config"
  type        = string
  default     = "" 
}

variable "redhift_cluster_jdbc_url" {
  description = "Specify the Redshift cluster jdbc url for the redshift firehose delivery stream"
  type        = string
  default     = "" 
}

variable "is_lambda_processor" {
  description = "Specify whether we'll use Lambda for our processing of data on the extended S3 config"
  type        = string
  default     = "false"  
}