variable "region" {
  description = "Specfies the region in which this resouce will be created in"
  type        = string
  default     = "af-south-1"
}
variable "sns_topic_name" {
  description = "Specifies the SNS topic name"
  type        = string  
}

variable "is_firehose_subscription" {
  description = "Specifies whether we create an SNS subscription for a firehose delivery stream pointing to a kinesis stream"
  type        = bool
  default     = false
}

variable "is_fifo_topic" {
  description = "Specifies whether our SNS topic will be fifo" 
  type        = bool
  default     = false   
}

variable "is_content_based_deduplication" {
  description = "Specifies whether our content based deduplication will be on" 
  type        = bool
  default     = false 
}

variable "policy_identifiers" {
  description = "Specify the policy identifiers for the iam policy document"
  type        = list(string)
  default     = [ "*" ]
}

variable "policy_doc_actions" {
  description = "Specify what actions will be permitted in your iam policy document"
  type        = list(string)
  defdefault  = [
      "SNS:Subscribe",
      "SNS:SetTopicAttributes",
      "SNS:RemovePermission",
      "SNS:Receive",
      "SNS:Publish",
      "SNS:ListSubscriptionsByTopic",
      "SNS:GetTopicAttributes",
      "SNS:DeleteTopic",
      "SNS:AddPermission",
    ] 
}

variable "delivery_policy" {
  description = "Delivery policy for SNS topic"
  type        = string
  default = <<EOF
{
  "http": {
    "defaultHealthyRetryPolicy": {
      "minDelayTarget": 20,
      "maxDelayTarget": 20,
      "numRetries": 3,
      "numMaxDelayRetries": 0,
      "numNoDelayRetries": 0,
      "numMinDelayRetries": 0,
      "backoffFunction": "linear"
    },
    "disableSubscriptionOverrides": false,
    "defaultThrottlePolicy": {
      "maxReceivesPerSecond": 1
    }
  }
}
EOF
}


variable "kinesis_delivery_stream_arn" {
  description = "Specify the firehose delivery stream arn that points to kinesis stream"
  type        = string
  default     = "" 
}

variable "sns_tags" {
  description = "Specify the tags (Key, Value pair) for the sns topic being created"
  type        = map(string)
}

variable "is_create_subscription_role" {
  description = "Specify whether to create a subcription role"
  type        = bool
  default     = false
}

variable "subscription_policy_doc_actions" {
  description = "Specify the actions to be used in the polic doc for the subscription role"
  type        = list(string)
  default     = [ "" ]
  
}