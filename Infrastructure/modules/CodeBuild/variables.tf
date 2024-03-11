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

variable "code_build_tags" {
  description = "The tags to apply to the CodeBuild project"
  type        = map(string)

}

variable "code_build_project_name" {
  description = "The name of the CodeBuild project"
  type        = string
}

variable "codebuild_iam_role_name" {
  description = "The name of the IAM role to create for the CodeBuild project"
  type        = string
}

variable "code_build_artifact_type" {
  description = "The type of artifact to produce"
  type        = string
  default     = "NO_ARTIFACTS"
}

variable "bucket_name" {
  description = "The name of the S3 bucket to store the build artifacts"
  type        = string
}

variable "artifact_name" {
  description = "The name of the build artifact"
  type        = string
  
}