locals {
  tags = {
    Environment = "Production"
    Owner       = "Shibule"
    Automation  = "Terraform"
    Purpose     = "DevOps"
  }
}


data "aws_iam_policy_document" "event_assume" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["events.amazonaws.com"]
    }
  }
}


# Create EventBridge bus
resource "aws_cloudwatch_event_bus" "eventbridge_bus" {
  name = "jenkins-bus"
  tags = merge({
    Name = "jenkins-eventbridge"
  }, local.tags)
}

# Create EventBridge rule
resource "aws_cloudwatch_event_rule" "eventbridge_rule" {
  name        = "jenkins-eventbridge-rule"
  description = "Trigger ECS Fargate task on ECR image push"

  event_pattern = <<EOF
  {
    "source": ["aws.ecr"],
    "detail-type": ["ECR Image Action"],
    "detail": {
      "action-type": ["PUSH"],
      "result": ["SUCCESS"],
      "repository-name": ["jenkins-repo"],
      "image-tag": ["v1"]
    }
  }
EOF

  event_bus_name = aws_cloudwatch_event_bus.eventbridge_bus.name

  tags = merge({
    Name = "jenkins-eventbridge-rule"
  }, local.tags)
}

# Create EventBridge target
resource "aws_cloudwatch_event_target" "eventbridge_target" {
  rule           = aws_cloudwatch_event_rule.eventbridge_rule.name
  arn            = aws_lambda_function.lambda_function.arn
  event_bus_name = aws_cloudwatch_event_bus.eventbridge_bus.arn
}

# Create IAM policy document for STS AssumeRole
data "aws_iam_policy_document" "sts_assume_role_policy" {
  statement {
    actions = ["sts:AssumeRole"]
    effect  = "Allow"
    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }
  }
}

data "aws_iam_policy_document" "lambda_execution_role_policy" {
  statement {
    actions = [
      "logs:CreateLogGroup",
      "logs:CreateLogStream",
      "logs:PutLogEvents",
      "ecr:*",
      "ecs:*",
      "events:*",
      "iam:PassRole",
    ]
    effect    = "Allow"
    resources = ["*"]
  }
}

resource "aws_iam_role" "lambda_role" {
  name               = "lambda-jenkins-role"
  assume_role_policy = data.aws_iam_policy_document.sts_assume_role_policy.json
  inline_policy {
    name   = "lambda-execution-role-policy"
    policy = data.aws_iam_policy_document.lambda_execution_role_policy.json
  }
}

resource "aws_iam_role" "event_bridge_role" {
  name               = "eventbridge-role"
  assume_role_policy = data.aws_iam_policy_document.event_assume.json

  inline_policy {
    name   = "eventbridge-policy"
    policy = data.aws_iam_policy_document.lambda_execution_role_policy.json
  }
  
}

# Create Lambda function
resource "aws_lambda_function" "lambda_function" {
  function_name    = "jenkins-lambda"
  role             = aws_iam_role.lambda_role.arn
  handler          = "lambda_handler"
  runtime          = "python3.8"
  filename         = "./redeploy-ecs/redeploy.zip"
  source_code_hash = filebase64sha256("./redeploy-ecs/redeploy.zip")
  environment {
    variables = {
      ECS_CLUSTER         = "disraptor-jenkins"
      ECS_TASK_DEFINITION = "jenkins-service"
    }
  }

  tags = merge(local.tags)
}

resource "aws_lambda_alias" "jenkins_alias" {
  name             = "jenkins-alias-prod"
  function_name    = aws_lambda_function.lambda_function.function_name
  function_version = "$LATEST"
}