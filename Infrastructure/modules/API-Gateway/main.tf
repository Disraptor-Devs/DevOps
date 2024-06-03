data "aws_api_gateway_rest_api" "existing_api_gateway" {
  count = var.is_existing_api_gateway ? 1 : 0
  name = var.existing_api_gateway_name
}


resource "aws_api_gateway_rest_api" "api_gateway" {
  count       = var.is_create_api_gateway ? 1 : 0
  name        = var.api_gateway_name
  description = var.api_gateway_description
  tags = merge({
    Name = var.api_gateway_name
  }, var.api_gateway_tags)
}

resource "aws_api_gateway_resource" "api_gateway_resource" {
  count       = var.is_api_gw_resource ? 1 : 0
  rest_api_id = var.is_create_api_gateway ? aws_api_gateway_rest_api.api_gateway[0].id : data.aws_api_gateway_rest_api.existing_api_gateway[0].id
  parent_id   = var.is_create_api_gateway ? aws_api_gateway_rest_api.api_gateway[0].root_resource_id : data.aws_api_gateway_rest_api.existing_api_gateway[0].root_resource_id
  path_part   = var.api_gw_path_part
}

resource "aws_api_gateway_method" "api_gateway_method" {
  count              = var.is_api_gw_method ? 1 : 0
  rest_api_id        = var.is_create_api_gateway ? aws_api_gateway_rest_api.api_gateway[0].id : data.aws_api_gateway_rest_api.existing_api_gateway[0].id
  resource_id        = aws_api_gateway_resource.api_gateway_resource[0].id
  http_method        = var.api_gateway_method_http_method
  authorization      = var.api_gateway_method_auth
  request_parameters = var.method_request_parameters

}

resource "aws_api_gateway_integration" "api_gateway_integration" {
  count                   = var.is_api_gw_integration ? 1 : 0
  rest_api_id             = var.is_create_api_gateway ? aws_api_gateway_rest_api.api_gateway[0].id : data.aws_api_gateway_rest_api.existing_api_gateway[0].id
  resource_id             = aws_api_gateway_resource.api_gateway_resource[0].id
  http_method             = aws_api_gateway_method.api_gateway_method[0].http_method
  integration_http_method = var.integration_http_method
  type                    = var.integration_type
  uri                     = var.lambda_invoke_arn

  request_parameters = var.integration_request_parameters
}

resource "aws_api_gateway_method_response" "api_gateway_method_response" {
  count       = var.is_api_gw_method_response ? 1 : 0
  rest_api_id = var.is_create_api_gateway ? aws_api_gateway_rest_api.api_gateway[0].id : data.aws_api_gateway_rest_api.existing_api_gateway[0].id
  resource_id = aws_api_gateway_resource.api_gateway_resource[0].id
  http_method = aws_api_gateway_method.api_gateway_method[0].http_method
  status_code = var.api_gw_method_response_status_code
}