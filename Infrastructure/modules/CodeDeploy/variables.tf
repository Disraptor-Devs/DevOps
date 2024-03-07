variable "region" {
  description = "The region in which the resources will be created"
  type        = string
  default     = "eu-central-1"
}

variable "backend_bucket" {
  description = "The name of the S3 bucket to store the Terraform state file"
  type        = string
  default     = "disraptor-terraform-state"
}

variable "dynamodb_lock_table" {
  description = "The name of the DynamoDB table to use for Terraform state locking"
  type        = string
}

variable "terraform_state_key" {
  description = "The path to the Terraform state file in the S3 bucket"
  type        = string
}


variable "deployment_config_name" {
  description = "The name of the deployment configuration"
  type        = string
}

variable "code_deploy_app_name" {
  description = "The name of the CodeDeploy application"
  type        = string
}

variable "deployment_group_name" {
  description = "The name of the deployment group"
  type        = string

}

variable "deployment_tags" {
  description = "The tags to apply to the deployment group"
  type        = map(string)
}

variable "trigger_name" {
  description = "The name of the trigger"
  type        = string
}

variable "sns_topic_name" {
  description = "The name of the SNS topic"
  type        = string
  
}

variable "code_deploy_role_name" {
  description = "The name of the IAM role for CodeDeploy"
  type        = string
}