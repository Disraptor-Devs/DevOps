variable "region" {
  description = "The AWS region where the infrastructure will be deployed. Default is 'af-south-1'."
  type        = string
  default     = "af-south-1"
}

variable "environment" {
  description = "The environment where the infrastructure is deployed, such as 'staging' or 'prod'. This helps in managing resources based on their lifecycle stage."
  type        = string
}

variable "tag_name" {
  description = "A name for the 'Name' tag that will be applied to all resources. This helps in identifying and managing your resources across AWS services."
  type        = string
}

variable "step_function_role_name" {
  description = "The name to assign to the IAM Role that will be used by the Step Function. This role allows the Step Function to interact with other AWS services."
  type        = string
}

variable "policy_statements" {
  description = "A list of policy statements to attach to the IAM Role. Each statement contains a list of actions and resources that define the permissions for the role."
  type = list(object({
    actions   = list(string)
    resources = list(string)
  }))
}

variable "policy_name" {
  description = "The name to assign to the IAM Policy that will be created. This policy includes all necessary permissions for the Step Function."
  type        = string
}

variable "step_function_name" {
  description = "The name to assign to the Step Function. This name is used to identify and manage the Step Function within AWS."
  type        = string
}

variable "step_func_code_definition" {
  description = "The JSON-encoded definition of the Step Function state machine. This defines the states, transitions, and tasks that make up the Step Function's workflow."
  type        = string
}
