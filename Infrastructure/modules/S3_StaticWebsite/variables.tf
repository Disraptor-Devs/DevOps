variable "region" {
  description = "The AWS region where the infrastructure will be deployed. Default is 'af-south-1'."
  type        = string
  default     = "af-south-1"
}

variable "bucket_name" {
  description = "A unique name for the S3 bucket. This name must be globally unique and adhere to S3 bucket naming conventions."
  type        = string
}

variable "environment" {
  description = "the environment that you are working in, i.e. 'staging' or 'prod'"
  type        = string
}

variable "tag_name" {
  description = "A name for the 'Name' tag that will be applied to all resources. This helps in identifying and managing your resources."
  type        = string
}

variable "index_document" {
  description = "The name of the index document to be served when a request is made to the root of the bucket or to a folder. Default is 'index.html'."
  type        = string
  default     = "index.html"
}

variable "error_document" {
  description = "The name of the error document to be served when a request results in an error (e.g., 404 Not Found). Default is 'error.html'."
  type        = string
  default     = "error.html"
}
