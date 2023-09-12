locals {
  call_get_secret = var.is_existing_parameter
}

resource "aws_ssm_parameter" "secret" {
  for_each = var.parameter_configs

  name        = each.key
  description = each.value["description"]
  type        = each.value["type"]
  value       = each.value["value"]

  tags = merge(var.ssm_parameter_tags)
}


data "aws_ssm_parameter" "getSecret" {
  for_each = toset(var.parameter_values_to_get_by_name)
  name     = each.key
}

data "aws_ssm_parameters_by_path" "getSecretByPath" {
  for_each = toset(var.parameter_values_to_get_by_path)
  path     = each.key
}