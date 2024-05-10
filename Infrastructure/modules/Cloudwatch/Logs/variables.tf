variable "region" {
  description = "Specfies the region in which this resouce will be created in"
  type        = string
  default     = "af-south-1"
}

variable "log_tags" {
  description = "Specifies the tags (key, value pairs) to be associated with the log group"
  type        = map(string)
}

variable "log_group_name" {
  description = "Specifies the name of the log group"
  type        = string
}
variable "log_group_retention_in_days" {
  description = "Specifies the number of days log events are kept in CloudWatch Logs"
  type        = number
  default     = null
}

variable "is_log_stream" {
  description = "Specifies whether to create a log stream"
  type        = bool
  default     = false
}

variable "log_stream_name" {
  description = "Specifies the name of the log stream"
  type        = string
  default     = null
}

variable "is_log_subscription_filter" {
  description = "Specifies whether to create a log subscription filter"
  type        = bool
  default     = false
}

variable "log_subscription_filter_name" {
  description = "Specifies the name of the log subscription filter"
  type        = string
  default     = null
}

variable "log_subscription_filter_pattern" {
  description = "Specifies the pattern to use for filtering a log subscription filter"
  type        = string
  default     = null
}

variable "log_subscription_filter_destination_arn" {
  description = "Specifies the destination arn to use for filtering a log subscription filter"
  type        = string
  default     = null
}
variable "cw_log_role_name" {
  description = "Specifies the name of the iam role to be created for cloudwatch logs"
  type        = string
}

variable "log_metric_filter_name" {
  description = "Specifies the name of the log metric filter"
  type        = string
  default     = null
}

variable "log_metric_filter_pattern" {
  description = "Specifies the pattern to use for filtering a log metric filter"
  type        = string
  default     = null
}

variable "log_destination_name" {
  description = "Specifies the name of the log destination"
  type        = string
  default     = null
}

variable "is_log_metric_filter" {
  description = "Specifies whether to create a log metric filter"
  type        = bool
  default     = false
}

variable "metric_tranformation_name" {
  description = "Specifies the name of the metric transformation"
  type        = string
  default     = null
}

variable "metric_tranformation_namespace" {
  description = "Specifies the namespace of the metric transformation"
  type        = string
  default     = null
}

variable "metric_tranformation_value" {
  description = "Specifies the value of the metric transformation"
  type        = string
  default     = null
}

variable "is_log_destination" {
  description = "Specifies whether to create a log destination"
  type        = bool
  default     = false
}

variable "policy_arns" {
  description = "Specify the policy arns to be attached to the lambda role"
  type        = set(string)
  default     = []
}

variable "is_kms_key" {
  description = "Specifies whether to create a kms key"
  type        = bool
  default     = false
}