variable "cluster_name" {
  description = "The name for the MSK cluster."
  type        = string
  default     = null
}

variable "kafka_version" {
  description = "The desired Kafka software version."
  type        = string
  default     = "2.8.1"
}

variable "number_of_broker_nodes" {
  description = "The number of broker nodes in the cluster."
  type        = number
  default     = 3
}

variable "instance_type" {
  description = "The instance type for broker nodes."
  type        = string
  default     = "kafka.t3.small"
}

variable "client_subnets" {
  description = "List of client subnets for the broker nodes."
  type        = list(string)
  default     = []
}

variable "volume_size" {
  description = "The EBS volume size for broker nodes."
  type        = number
  default     = 2
}

variable "security_group_id" {
  description = "The ID of the security group for the MSK cluster."
  type        = list(string)
  default     = []
}

variable "kms_key_arn" {
  description = "The ARN of the KMS key for encryption at rest."
  type        = string
  default     = null
}

variable "jmx_exporter_enabled" {
  description = "Enable JMX exporter for monitoring."
  type        = bool
  default     = null
}

variable "node_exporter_enabled" {
  description = "Enable node exporter for monitoring."
  type        = bool
  default     = null
}

variable "cloudwatch_logs_enabled" {
  description = "Enable CloudWatch Logs for MSK logs."
  type        = bool
  default     = null
}

variable "cloudwatch_log_group_name" {
  description = "The name of the CloudWatch Log Group for MSK logs."
  type        = string
  default     = "msk-logs"
}

variable "firehose_enabled" {
  description = "Enable Kinesis Firehose for MSK logs."
  type        = bool
  default     = null
}

variable "firehose_delivery_stream_name" {
  description = "The name of the Kinesis Firehose Delivery Stream for MSK logs."
  type        = string
  default     = null
}

variable "s3_logs_enabled" {
  description = "Enable S3 bucket for MSK logs."
  type        = bool
  default     = null
}

variable "s3_bucket_name" {
  description = "The name of the S3 bucket for MSK logs."
  type        = string
  default     = null
}

variable "tags" {
  description = "A map of tags to apply to the MSK cluster."
  type        = map(string)
}