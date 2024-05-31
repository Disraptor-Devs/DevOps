output "api_gateway_id" {
  description = "Output the API Gateway id"
  value       = aws_api_gateway_rest_api.api_gateway.id
}

output "api_gateway_root_resource_id" {
  description = "Output the API Gateway root resource id"
  value       = aws_api_gateway_rest_api.api_gateway.root_resource_id

}
