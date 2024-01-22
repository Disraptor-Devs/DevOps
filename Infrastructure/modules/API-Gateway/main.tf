
resource "aws_api_gateway_rest_api" "api_gateway" {
  name        = var.api_gateway_name
  description = var.api_gateway_description
}

resource "aws_api_gateway_resource" "api_gateway_resource" {
  rest_api_id = aws_api_gateway_rest_api.api_gateway.id
  parent_id   = aws_api_gateway_rest_api.api_gateway.root_resource_id
  path_part   = "{proxy+}"
}

resource "aws_api_gateway_method" "api_gateway_method" {
  rest_api_id        = aws_api_gateway_rest_api.api_gateway.id
  resource_id        = aws_api_gateway_resource.api_gateway_resource.id
  http_method        = var.api_gateway_method_http_method
  authorization      = var.api_gateway_method_auth
  request_parameters = var.method_request_parameters
}

resource "aws_api_gateway_integration" "api_gateway_integration" {
  rest_api_id             = aws_api_gateway_rest_api.api_gateway.id
  resource_id             = aws_api_gateway_resource.api_gateway_resource.id
  http_method             = aws_api_gateway_method.api_gateway_method.http_method
  integration_http_method = var.integration_http_method
  type                    = var.integration_type
  uri                     = var.lambda_invoke_arn

  request_parameters = var.integration_request_parameters
}

resource "aws_api_gateway_method_response" "api_gateway_method_response" {
  rest_api_id = aws_api_gateway_rest_api.api_gateway.id
  resource_id = aws_api_gateway_resource.api_gateway_resource.id
  http_method = aws_api_gateway_method.api_gateway_method.http_method
  status_code = "200"
}