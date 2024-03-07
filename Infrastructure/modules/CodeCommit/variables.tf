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

variable "terraform_state_key" {
  description = "The path to the Terraform state file in the S3 bucket"
  type        = string
}

variable "dynamodb_lock_table" {
  description = "The name of the DynamoDB table to use for Terraform state locking"
  type        = string
}

variable "code_commit_repository_name" {
  description = "The name of the CodeCommit repository"
  type        = string
}