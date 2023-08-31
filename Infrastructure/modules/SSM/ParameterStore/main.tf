locals {
  call_get_secret = var.is_existing_parameter ? 1 : 0
}

resource "aws_ssm_parameter" "secret" {
  for_each = var.parameter_configs

  name        = each.key
  description = each.value["description"]
  type        = each.value["type"]
  value       = each.value["value"]

  tags = merge(var.parameter_tags)
}


data "aws_ssm_parameter" "getSecret" {
  count = local.call_get_secret

  for_each = toset(var.parameter_values_to_get_by_name)
  name     = each.key
}

data "aws_ssm_parameters_by_path" "getSecretByPath" {
  count = local.call_get_secret

  for_each = toset(var.parameter_values_to_get_by_path)
  path     = each.key
}