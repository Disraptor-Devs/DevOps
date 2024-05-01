variable "region" {
  description = "The region in which the resources will be created"
  type        = string
  default     = "eu-central-1"
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


variable "artifact_name" {
  description = "The name of the build artifact"
  type        = string
}

variable "environment" {
  description = "The environment CodeBuild runs for "
  type        = string
}