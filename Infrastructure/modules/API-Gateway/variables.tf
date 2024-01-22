variable "region" {
  description = "Specfies the region in which this resouce will be created in"
  type        = string
  default     = "af-south-1"
}


variable "lambda_function_name" {
  description = "Name of the Lambda function"
  type        = string
  default     = null
}

variable "api_gateway_name" {
  description = "Name of the API Gateway"
  type        = string
}

variable "api_gateway_description" {
  description = "Description of the API Gateway"
  type        = string
}

variable "api_gateway_method_http_method" {
  description = "HTTP method for the API Gateway"
  type        = string
  default     = "ANY"
}

variable "api_gateway_method_auth" {
  description = "Authorization for the API Gateway"
  type        = string
  default     = "NONE"
}

variable "method_request_parameters" {
  description = "Request parameters for the API Gateway"
  type        = map(string)
  default     = null
}

variable "integration_request_parameters" {
  description = "Request parameters for the API Gateway"
  type        = map(string)
  default     = null

}

variable "lambda_tags" {
  description = "Specifies the tags (Key, Value pairs) to be associated to the lambda resources"
  type        = map(string)
}

variable "lambda_invoke_arn" {
  description = "ARN of the Lambda function"
  type        = string
  default     = null
}

variable "integration_http_method" {
  description = "HTTP method for the API Gateway"
  type        = string
  default     = "ANY"
}

variable "integration_type" {
  description = "Type of integration for the API Gateway"
  type        = string
  default     = "AWS_PROXY"
}

variable "api_gateway_tags" {
  description = "Specifies the tags (Key, Value pairs) to be associated to the API Gateway resources"
  type        = map(string)
}