data "aws_iam_policy_document" "event_bus_policy_doc" {
  statement {
    effect = "Allow"
    actions = [
      "events:*",
    ]
    resources = ["*"]

  }
}

data "aws_iam_policy_document" "event_rule_role_doc" {
  statement {
    effect  = "Allow"
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["events.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "eventBridge_rule_role" {
  name               = var.eventBridge_rule_role_name
  assume_role_policy = data.aws_iam_policy_document.event_bus_policy_doc.json
}

resource "aws_iam_role_policy_attachment" "eventBridge__policy" {
  for_each   = var.policy_arns
  policy_arn = each.value
  role       = aws_iam_role.eventBridge_rule_role.name
  depends_on = [aws_iam_role.eventBridge_rule_role]
}


resource "aws_cloudwatch_event_bus" "event_bridge_bus" {
  name = var.eventBridge_bus_name
  tags = var.eventBridge_tags
}

resource "aws_cloudwatch_event_bus_policy" "event_bus_policy" {
  event_bus_name = aws_cloudwatch_event_bus.event_bridge_bus.name
  policy         = data.aws_iam_policy_document.event_bus_policy_doc.json
}

resource "aws_cloudwatch_event_rule" "event_bridge" {
  name                = var.eventBridge_rule_name
  description         = var.eventBridge_rule_description
  event_pattern       = var.eventBridge_rule_event_pattern
  role_arn            = aws_iam_role.eventBridge_rule_role.arn
  event_bus_name      = aws_cloudwatch_event_bus.event_bridge_bus.name
  schedule_expression = var.eventBridge_rule_schedule_expression
  tags                = var.eventBridge_tags
}

resource "aws_cloudwatch_event_target" "eventBridge_target" {
  rule      = aws_cloudwatch_event_rule.event_bridge.name
  arn       = var.eventBridge_target_arn
  target_id = var.eventBridge_target_id
  role_arn  = var.eventBridge_role_arn

  dynamic "run_command_targets" {
    for_each = var.run_command_targets == null ? [] : [var.run_command_targets]
    content {
      key    = var.run_command_targets.key
      values = var.run_command_targets.values
    }
  }

  dynamic "http_target" {
    for_each = var.eventBridge_is_http_targets ? [1] : []
    content {
      header_parameters       = var.eventBridge_http_target_header_parameters
      path_parameter_values   = var.eventBridge_http_target_path_parameter_values
      query_string_parameters = var.eventBridge_http_target_query_string_parameters
    }
  }
}

resource "aws_cloudwatch_event_connection" "eventBridge_connection" {
  count              = var.eventBridge_is_connection ? 1 : 0
  name               = var.eventBridge_connection_name
  description        = var.eventBridge_connection_description
  authorization_type = var.eventBridge_connection_authorization_type

  dynamic "auth_parameters" {
    for_each = var.eventBridge_connection_auth_parameters ? [1] : []
    content {

      dynamic "basic" {
        for_each = var.eventBridge_connnection_is_auth_basic ? [1] : []
        content {
          username = var.eventBridge_connection_auth_basic_username
          password = var.eventBridge_connection_auth_basic_password
        }
      }

      dynamic "api_key" {
        for_each = var.eventBridge_connnection_is_auth_api_key ? [1] : []
        content {
          key   = var.eventBridge_connection_auth_params_api_key
          value = var.eventBridge_connection_auth_params_api_value
        }
      }

    }
  }
}


resource "aws_cloudwatch_event_api_destination" "api_dest" {
  count = var.is_eventBridge_api_destination ? 1 : 0

  name                             = var.eventBridge_api_destination_name
  description                      = var.eventBridge_api_destination_description
  invocation_endpoint              = var.eventBridge_api_invocation_endpoint
  http_method                      = var.eventBridge_api_http_method
  invocation_rate_limit_per_second = var.eventBridge_api_invocation_rate_limit_per_second
  connection_arn                   = aws_cloudwatch_event_connection.eventBridge_connection.arn
}