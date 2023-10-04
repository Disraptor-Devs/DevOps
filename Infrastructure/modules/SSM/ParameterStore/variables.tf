variable "region" {
  description = "Specify Region in which the AWS resources will be deployed"
  type        = string
  default     = "af-south-1"
}

variable "parameter_configs" {
  description = "Specify the values that will be used to define the SSM parameter"
  type = map(object({
    name        = string
    description = string
    type        = string
    value       = string
  }))
}

variable "parameter_values_to_get_by_name" {
  description = "Specifies the names we'll use to get the parameter value"
  type        = list(string)
  default     = []
}

variable "parameter_values_to_get_by_path" {
  description = "Specifies the paths we'll use to get the parameter value"
  type        = list(string)
  default     = []
}

variable "is_get_value" {
  description = "Specify if we're dealing with an existing parameter and we just need to get the value"
  type        = bool
  default     = false
}

variable "is_get_value_by_path" {
  description = "Specify if we're dealing with an existing parameter and we just need to get the value by path"
  type        = bool
  default     = false
}

variable "ssm_parameter_tags" {
  description = "Specify the tags for the SSM Parameter being created"
  type        = map(string)
}