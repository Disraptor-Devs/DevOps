variable "region" {
  description = "Specfies the region in which this resouce will be created in"
  type        = string
  default     = "af-south-1"
}

variable "metric_stream_iam_role_name" {
  description = "Specify the name for the Iam role that will be created for the metric stream"
  type        = string
}

variable "metric_alarm_name" {
  description = "Specifies the name of the metric alarm"
  type        = string
}

variable "metric_alarm_description" {
  description = "Specifies the description of the metric alarm"
  type        = string
}

variable "metric_alarm_comparison_operator" {
  description = "Specifies thhe arithmetic operation to use when comparing the specified Statistic and Threshold. The specified Statistic value is used as the first operand."
  type        = string
}

variable "metric_alarm_evaluation_periods" {
  description = "Specifies the number of periods over which data is compared to the specified threshold."
  type        = number
}

variable "metric_name" {
  description = "Specify the name for the alarm's associated metric"
  type        = string
  default     = null
}

variable "metric_alarm_namespace" {
  description = "Specify the namespace for the alarm's associated metric"
  type        = string
}


variable "metric_alarm_period" {
  description = "Specify tThe period in seconds over which the specified statistic is applied. Valid values are 10, 30, or any multiple of 60."
  type        = number
  default     = null
}

variable "metric_alarm_statistic" {
  description = "Specify the statistic to apply to the alarm's associated metric. Either of the following is supported: SampleCount, Average, Sum, Minimum, Maximum"
  type        = string
  default     = null
}

variable "metric_alarm_threshold" {
  description = "Specify the value against which the specified statistic is compared."
  type        = number
  default     = null
}

variable "metric_alarm_insufficient_data_actions" {
  description = "Specify the list of actions to execute when this alarm transitions into an INSUFFICIENT_DATA state from any other state. Each action is specified as an ARN"
  type        = list(string)
  default     = null
}

variable "metric_stream_name" {
  description = "Specify the name of the metric stream"
  type        = string
}

variable "firehose_delivery_stream_arn" {
  description = "Specify the arn of the firehose delivery stream to use for this metric stream"
  type        = string
}

variable "metric_stream_filters" {
  description = "Specify the filters for the metric stream"
  type        = map(set(string))
}


variable "metric_alarm_tags" {
  description = "Specify the tags (key, value pairs) to be associated with the metric alarm"
  type        = map(string)
}

variable "metric_stream_output_format" {
  description = "Specify the output format for the metric stream"
  type        = string
  default     = "json"
}

variable "is_create_composite_alarm" {
  description = "Specify whether to create a composite alarm"
  type        = bool
  default     = false
}

variable "composite_alarm_name" {
  description = "Specify the name of the composite alarm"
  type        = string
  default     = null
}

variable "composite_alarm_description" {
  description = "Specify the description of the composite alarm"
  type        = string
  default     = null
}

variable "alarm_actions_arns" {
  description = "Specify the list of actions to execute when this alarm transitions into an ALARM state from any other state. Each action is specified as an ARN."
  type        = list(string)
  default     = null
}

variable "ok_actions_arns" {
  description = "Specify the list of actions to execute when this alarm transitions into an OK state from any other state. Each action is specified as an ARN."
  type        = list(string)
  default     = null
}

variable "is_actions_enabled" {
  description = "Specify whether the actions for the composite alarm are enabled"
  type        = bool
  default     = false
}

variable "composite_alarm_rule" {
  description = "Specify the rule for the composite alarm"
  type        = string
  default     = null
}

variable "actions_suppressor_alarm_name_or_arn" {
  description = "Specify the name or arn of the alarm to which the suppression will be applied"
  type        = string
  default     = null
}

variable "actions_suppressor_extension_period" {
  description = "Specify the maximum time in seconds that the composite alarm waits after suppressor alarm goes out of the ALARM state. After this time, the composite alarm performs its actions."
  type        = number
  default     = null
}

variable "actions_suppressor_wait_period" {
  description = "Specify the maximum time in seconds that the composite alarm waits for the suppressor alarm to go into the ALARM state. After this time, the composite alarm performs its actions."
  type        = number
  default     = null
}

variable "is_action_suppresor" {
  description = "Specify whether to create an action suppressor"
  type        = bool
  default     = false
}