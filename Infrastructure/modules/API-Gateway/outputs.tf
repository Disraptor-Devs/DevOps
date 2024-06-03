output "api_gateway_id" {
  description = "Output the API Gateway id"
  value       = var.is_existing_api_gateway ? aws_api_gateway_rest_api.api_gateway[0].id : data.aws_api_gateway_rest_api.existing_api_gateway[0].id
}

output "api_gateway_root_resource_id" {
  description = "Output the API Gateway root resource id"
  value       = var.is_existing_api_gateway ? aws_api_gateway_rest_api.api_gateway[0].root_resource_id : data.aws_api_gateway_rest_api.existing_api_gateway[0].id
}


output "api_gw_integration_id" {
  description = "Output the API Gateway integration"
  value       = var.is_api_gw_integration ? aws_api_gateway_integration.api_gateway_integration[0].id : null
}

output "aws_api_gw_resource_id" {
  description = "Output the API Gateway resource id"
  value       = var.is_api_gw_resource ? aws_api_gateway_resource.api_gateway_resource[0].id : null
  
}