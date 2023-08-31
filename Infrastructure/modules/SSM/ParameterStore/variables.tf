variable "region" {
  description = "Specify Region in which the AWS resources will be deployed"
  type        = string
  default     = "af-south-1"
}

variable "parameter_configs" {
  description = "Specify the values that will be used to define the SSM parameter"
  type        = map(map(string))
  default     = {}
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

variable "is_existing_parameter" {
  description = "Specify if we're dealing with an existing parameter or we're creating a new one from scratch"
  type        = bool
  default     = false

}

variable "ssm_parameter_tags" {
  description = "Specify the tags for the SSM Parameter being created"
  type        = map(string)
}