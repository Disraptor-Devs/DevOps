variable "region" {
  description = "The region in which the resources will be created"
  type        = string
  default     = "eu-central-1"
}

variable "code_commit_repository_name" {
  description = "The name of the CodeCommit repository"
  type        = string
}