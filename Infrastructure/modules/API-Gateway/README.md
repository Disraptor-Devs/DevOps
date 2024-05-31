## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 2.70.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.33.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_api_gateway_integration.api_gateway_integration](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/api_gateway_integration) | resource |
| [aws_api_gateway_method.api_gateway_method](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/api_gateway_method) | resource |
| [aws_api_gateway_method_response.api_gateway_method_response](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/api_gateway_method_response) | resource |
| [aws_api_gateway_resource.api_gateway_resource](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/api_gateway_resource) | resource |
| [aws_api_gateway_rest_api.api_gateway](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/api_gateway_rest_api) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_api_gateway_description"></a> [api\_gateway\_description](#input\_api\_gateway\_description) | Description of the API Gateway | `string` | n/a | yes |
| <a name="input_api_gateway_name"></a> [api\_gateway\_name](#input\_api\_gateway\_name) | Name of the API Gateway | `string` | n/a | yes |
| <a name="input_api_gateway_tags"></a> [api\_gateway\_tags](#input\_api\_gateway\_tags) | Specifies the tags (Key, Value pairs) to be associated to the API Gateway resources | `map(string)` | n/a | yes |
| <a name="input_lambda_tags"></a> [lambda\_tags](#input\_lambda\_tags) | Specifies the tags (Key, Value pairs) to be associated to the lambda resources | `map(string)` | n/a | yes |
| <a name="input_api_gateway_method_auth"></a> [api\_gateway\_method\_auth](#input\_api\_gateway\_method\_auth) | Authorization for the API Gateway | `string` | `"NONE"` | no |
| <a name="input_api_gateway_method_http_method"></a> [api\_gateway\_method\_http\_method](#input\_api\_gateway\_method\_http\_method) | HTTP method for the API Gateway | `string` | `"ANY"` | no |
| <a name="input_api_gw_method_response_status_code"></a> [api\_gw\_method\_response\_status\_code](#input\_api\_gw\_method\_response\_status\_code) | Status code for the API Gateway method response | `string` | `"200"` | no |
| <a name="input_api_gw_path_part"></a> [api\_gw\_path\_part](#input\_api\_gw\_path\_part) | Path part for the API Gateway resource | `string` | `null` | no |
| <a name="input_integration_http_method"></a> [integration\_http\_method](#input\_integration\_http\_method) | HTTP method for the API Gateway | `string` | `"ANY"` | no |
| <a name="input_integration_request_parameters"></a> [integration\_request\_parameters](#input\_integration\_request\_parameters) | Request parameters for the API Gateway | `map(string)` | `null` | no |
| <a name="input_integration_type"></a> [integration\_type](#input\_integration\_type) | Type of integration for the API Gateway | `string` | `"AWS_PROXY"` | no |
| <a name="input_is_api_gw_integration"></a> [is\_api\_gw\_integration](#input\_is\_api\_gw\_integration) | Specifies if the API Gateway integration should be created | `bool` | `false` | no |
| <a name="input_is_api_gw_method"></a> [is\_api\_gw\_method](#input\_is\_api\_gw\_method) | Specifies if the API Gateway method should be created | `bool` | `false` | no |
| <a name="input_is_api_gw_method_response"></a> [is\_api\_gw\_method\_response](#input\_is\_api\_gw\_method\_response) | Specifies if the API Gateway method response should be created | `bool` | `false` | no |
| <a name="input_is_api_gw_resource"></a> [is\_api\_gw\_resource](#input\_is\_api\_gw\_resource) | Specifies if the API Gateway resource should be created | `bool` | `false` | no |
| <a name="input_lambda_function_name"></a> [lambda\_function\_name](#input\_lambda\_function\_name) | Name of the Lambda function | `string` | `null` | no |
| <a name="input_lambda_invoke_arn"></a> [lambda\_invoke\_arn](#input\_lambda\_invoke\_arn) | ARN of the Lambda function | `string` | `null` | no |
| <a name="input_method_request_parameters"></a> [method\_request\_parameters](#input\_method\_request\_parameters) | Request parameters for the API Gateway | `map(string)` | `null` | no |
| <a name="input_region"></a> [region](#input\_region) | Specfies the region in which this resouce will be created in | `string` | `"af-south-1"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_api_gateway_id"></a> [api\_gateway\_id](#output\_api\_gateway\_id) | Output the API Gateway id |
| <a name="output_api_gateway_root_resource_id"></a> [api\_gateway\_root\_resource\_id](#output\_api\_gateway\_root\_resource\_id) | Output the API Gateway root resource id |
