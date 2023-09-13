variable "region" {
  description = "Specfies the region in which this resouce will be created in"
  type        = string
  default     = "af-south-1"
}

variable "kinesis_data_stream_name" {
  description = "Specfies the name for the kinesis stream that will be creatd"
  type        = string
}

variable "kinesis_shard_count" {
  description = "Specfies the number of shards for the kinesis stream being created"
  type        = number
}

variable "kinesis_retention_period" {
  description = "Specfies how long the data in the stream should be kept for"
  type        = number
}

variable "kinesis_shard_level_metrics" {
  description = "Specfies the shard level metrics for our shard"
  type        = set(string)
  default     = ["IncomingBytes", "OutgoingBytes"]
}


variable "kinesis_stream_mode_details" {
  description = "Specifies the stream mode for the kinesis stream being created"
  type        = string
  default     = "PROVISIONED"
}

variable "kds_tags" {
  description = "Provide tags (key, value pairs) for the stream being created"
  type        = map(string)
}

variable "kinesis_consumer_name" {
  description = "Specify the name of the Kinesis stream consumer"
  type        = string
  default     = ""
}

variable "kinesis_encryption_type" {
  description = "Specify the type of encryption to apply to the stream"
  type        = string
  default     = "KMS"
}

variable "is_kinesis_consumer" {
  description = "Specifies whether we'll create a Kinesis Consumer"
  type        = bool
  default     = false
}

variable "enforce_consumer_deletion" {
  description = "Specifies if registered consumers should be deregistered from the stream so that the stream can be destroyed."
  type        = bool
  default     = false 
} 