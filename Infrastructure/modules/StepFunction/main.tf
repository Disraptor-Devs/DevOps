data "aws_iam_policy_document" "sf_assume_role" {
  statement {
    effect = "Allow"
    principals {
      type        = "Service"
      identifiers = ["states.amazonaws.com"]
    }
    actions = ["sts:AssumeRole"]
  }
}

resource "aws_iam_role" "step_function_role" {
  name               = var.step_function_role_name
  assume_role_policy = data.aws_iam_policy_document.sf_assume_role.json

  tags = {
    Name        = var.tag_name,
    owner       = "disraptor",
    environment = var.environment,
    service     = "IAM Role",
    type        = "application"
  }
}

data "aws_iam_policy_document" "policy_attachments" {
  dynamic "statement" {
    for_each = var.policy_statements
    content {
      effect    = "Allow"
      actions   = statement.value.actions
      resources = statement.value.resources
    }
  }
}

resource "aws_iam_policy" "sf_policy" {
  name   = var.policy_name
  policy = data.aws_iam_policy_document.policy_attachments.json
  tags = {
    Name        = var.tag_name,
    owner       = "disraptor",
    environment = var.environment,
    service     = "IAM Policy",
    type        = "application"
  }
}

resource "aws_iam_role_policy_attachment" "policy_sf_attach" {
  role       = aws_iam_role.step_function_role.name
  policy_arn = aws_iam_policy.sf_policy.arn
}

resource "aws_sfn_state_machine" "state_machine" {
  name       = var.step_function_name
  role_arn   = aws_iam_role.step_function_role.arn
  definition = var.step_func_code_definition

}
