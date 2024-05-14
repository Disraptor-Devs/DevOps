variable "admin_topic_name" {
  description = "Name for the admin SNS topic"
}

variable "dev_topic_name" {
  description = "Name for the dev SNS topic"
}


variable "environment" {
  description = "Environment name (e.g., staging, production)"
}

variable "stage" {
  description = "Stage of the environment (e.g., dev, admin)"
}

variable "create_sns_publish_policy" {
  description = "Whether to create SNS publish policy for admin and dev topics"
  default     = false
}
