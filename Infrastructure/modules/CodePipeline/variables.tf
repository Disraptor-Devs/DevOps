variable "region" {
  description = "The region in which the resources will be created"
  type        = string
  default     = "eu-central-1"
}

variable "code_pipeline_tags" {
  description = "The tags to apply to the CodeBuild project"
  type        = map(string)
}

variable "code_pipeline_name" {
  description = "The name of the CodePipeline"
  type        = string
}

variable "code_pipeline_artifact_store_bucket" {
  description = "The name of the S3 bucket to store the CodePipeline artifacts"
  type        = string
}
variable "code_commit_repository_name" {
  description = "The name of the CodeCommit repository"
  type        = string
}

variable "code_commit_branch_name" {
  description = "The name of the CodeCommit branch"
  type        = string

}

variable "code_build_project_name" {
  description = "The name of the CodeBuild project"
  type        = string
}

variable "code_pipeline_role_name" {
  description = "The name of the IAM role to create for the CodePipeline"
  type        = string
}

variable "environment" {
  description = "The environment CodeBuild runs for "
  type        = string
}

variable "code_pipeline_actions" {
  description = "The actions to be performed by the CodePipeline"
  type        = set(string)
  
}

variable "code_pipeline_artifact_store" {
  description = "The type of artifact store to use"
  type        = string
  default     = "S3"
  
}