variable "region" {
  description = "Specfies the region in which this resouce will be created in"
  type        = string
  default     = "af-south-1"
}

variable "lambda_tags" {
  description = "Specifies the tags (Key, Value pairs) to be associated to the lambda resources"
  type        = map(string)
}

variable "lambda_iam_role_name" {
  description = "Specify the name for the Iam role that will be created for the lambda function"
  type        = string
}

variable "archive_type" {
  description = "Specify the Archive type to be used for the file/code you're referencing"
  type        = string
  default     = "zip"
}

variable "path_to_code" {
  description = "Specify the path to where your file/code is located"
  type        = string
  default     = null
}

variable "output_path" {
  description = "Specify the output name of the zipped file/code"
  type        = string
  default     = null
}

variable "function_name" {
  description = "Specify the name of the lambda function being created"
  type        = string
}

variable "function_description" {
  description = "Specify the description for the lambda function"
  type        = string

}

variable "lambda_variables" {
  description = "Specify variables for our lambda function"
  type        = map(string)
  default     = {}
}

variable "lambda_alias_name" {
  description = "Specify the name to use for the lambda alias being created."
  type        = string
}

variable "lambda_alias_description" {
  description = "Specify the description for the lambda alias."
  type        = string
}

variable "lambda_alias_function_version" {
  description = "Specify the version for the lambda function being associated to the alias."
  type        = string
}

variable "is_deployment_package_local" {
  description = "Specify whether the zip file with the code for the lambda function is stored on S3."
  type        = bool
  default     = false
}

variable "s3_bucket_for_lambda" {
  description = "Specify the S3 bucket where your code for the lambda function lives."
  type        = string
  default     = null
}

variable "s3_key_to_code_for_lambda" {
  description = "Specify the S3 key to your code for the lambda function."
  type        = string
  default     = null
}

variable "lambda_function_runtime" {
  description = "Specify the runtime for the lambda function"
  type        = string
}

variable "lambda_handler" {
  description = "Specify entry point of your function"
  type        = string
  default     = null
}

variable "kinesis_stream_arn" {
  description = "Specify the kinesis stream arn to be used in the event source mapping"
  type        = string
  default     = null
}

variable "event_starting_position" {
  description = "Specify the starting position for the event source mapping"
  type        = string
  default     = "LATEST"
}

variable "starting_pos_timestamp" {
  description = "Specify the starting position timestamp only if event_starting_position is set to AT_TIMESTAMP"
  type        = string
  default     = null
}

variable "sns_failure_topic_arn" {
  description = "Specify the arn for the sns topic that will be used for failures "
  type        = string
  default     = null
}

variable "msk_cluster_arn" {
  description = "Specify the msk cluster arn to be used in the event source mapping"
  type        = string
  default     = null
}

variable "msk_topics" {
  description = "Specify the topics used in the msk cluster"
  type        = set(string)
  default     = []
}

variable "is_kafka_event_source_config" {
  description = "Specify whether to add in the kafka event source config block for the msk event source mapping"
  type        = bool
  default     = false
}

variable "is_kinesis_event_source" {
  description = "Specify whether to create the event source mapping for a kinesis stream"
  type        = bool
  default     = false
}

variable "is_msk_cluster_event_source" {
  description = "Specify whether to create the event source mapping for msk"
  type        = bool
  default     = false
}

variable "managed_kafka_consumer_group_id" {
  description = "Specify the consumer group id for the amazon_managed_kafka_event_source_config"
  type        = string
  default     = null
}

variable "lambda_permission_action" {
  description = "Specify the action that will be allowed on the lambda function (to be used in aws lambda permission)"
  type        = string
  default     = "lambda:InvokeFunction"
}

variable "lambda_permission_statement_id" {
  description = "Specify the statement id for the aws lambda permission"
  type        = string
  default     = null
}

variable "s3_bucket_arn" {
  description = "Specify the S3 bucket arn you want to give permission to perform an action on the lambda function"
  type        = string
  default     = null
}

variable "cloudwatch_arn" {
  description = "Specify the Cloudwatch arn you want to give permission to perform an action on the lambda function"
  type        = string
  default     = null
}

variable "sns_arn" {
  description = "Specify the SNS arn you want to give permission to perform an action on the lambda function"
  type        = string
  default     = null
}

variable "is_allow_s3_action_on_lambda" {
  description = "Specify whether we'll allow S3 an action on the lambda function"
  type        = bool
  default     = false
}

variable "is_allow_cloudwatch_action_on_lambda" {
  description = "Specify whether we'll allow Cloudwatch an action on the lambda function"
  type        = bool
  default     = false
}

variable "is_allow_sns_action_on_lambda" {
  description = "Specify whether we'll allow SNS an action on the lambda function"
  type        = bool
  default     = false
}

variable "is_lambda_provisioned_concurrency" {
  description = "Specify whether we provision concurrency or our lambda function"
  type        = bool
  default     = false
}

variable "concurrent_excutions" {
  description = "Amount of capacity to allocate"
  type        = number
  default     = 1
}

variable "is_lambda_function_url" {
  description = "Specify whether we'll create a url for our lambda function"
  type        = bool
  default     = false
}

variable "lambda_function_url_auth_type" {
  description = "The type of authentication that the function URL uses."
  type        = string
  default     = "AWS_IAM"
}

variable "lambda_function_url_cors_allow_credentials" {
  description = "Whether to allow cookies or other credentials in requests to the function URL."
  type        = bool
  default     = false

}

variable "lambda_function_url_cors_allow_origins" {
  description = "The origins that can access the function URL."
  type        = set(string)
  default     = ["*"]
}

variable "lambda_function_url_cors_allow_methods" {
  description = "The HTTP methods that are allowed when calling the function URL. For example: [GET, POST, DELETE]."
  type        = set(string)
  default     = ["*"]
}

variable "lambda_function_url_cors_allow_headers" {
  description = "The HTTP headers that origins can include in requests to the function URL. For example: [date, keep-alive, x-custom-header]."
  type        = set(string)
  default     = ["date", "keep-alive"]
}

variable "lambda_function_url_cors_expose_headers" {
  description = "The HTTP headers in your function response that you want to expose to origins that call the function URL."
  type        = set(string)
  default     = ["keep-alive", "date"]
}

variable "lambda_function_url_cors_max_age" {
  description = "The maximum amount of time, in seconds, that web browsers can cache results of a preflight request."
  type        = number
  default     = 0
}

variable "is_function_variables" {
  description = "Specify whether we'll pass in environment variables for our lambda function"
  type        = bool
  default     = false
}

variable "lambda_layer_name" {
  description = "Specify the name for the lambda layer"
  type        = string
}

variable "lambda_layer_description" {
  description = "Specify the description for the lambda layer"
  type        = string
  default     = null 
}

variable "lambda_layer_compatible_runtimes" {
  description = "Specify the compatible runtimes for the lambda layer"
  type        = set(string)
  default     = ["nodejs18.x"]
}

variable "lambda_layer_file" {
  description = "Specify the path to the file/code for the lambda layer"
  type        = string
  default     = null
}

variable "is_lambda_layer" { 
  description = "Specify whether we'll create a lambda layer"
  type        = bool
  default     = false
}