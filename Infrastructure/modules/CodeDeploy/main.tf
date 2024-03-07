data "aws_iam_policy_document" "assume_role" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["codedeploy.amazonaws.com"]
    }
  }

}

resource "aws_iam_role" "code_deploy" {
  name               = var.code_deploy_role_name
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
}

resource "aws_iam_role_policy_attachment" "s3_access" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
  role       = aws_iam_role.code_deploy.name
}

resource "aws_iam_role_policy_attachment" "logs_access" {
  policy_arn = "arn:aws:iam::aws:policy/CloudWatchLogsFullAccess"
  role       = aws_iam_role.code_deploy.name
}

resource "aws_iam_role_policy_attachment" "sns_access" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonSNSFullAccess"
  role       = aws_iam_role.code_deploy.name
}

resource "aws_iam_role_policy_attachment" "code_build_access" {
  policy_arn = "arn:aws:iam::aws:policy/AWSCodeBuildAdminAccess"
  role       = aws_iam_role.code_deploy.name
}

resource "aws_codedeploy_deployment_config" "deployment_config" {
  deployment_config_name = var.deployment_config_name
  compute_platform       = "Lambda"

  traffic_routing_config {
    type = "TimeBasedLinear"

    time_based_linear {
      interval   = 10
      percentage = 50
    }
  }
}

resource "aws_codedeploy_app" "code_deploy_app" {
  compute_platform = "Lambda"
  name             = var.code_deploy_app_name
  tags             = var.deployment_tags
}

data "aws_sns_topic" "sns_topic" {
  name = var.sns_topic_name
}

resource "aws_codedeploy_deployment_group" "deployment_group" {
  app_name               = aws_codedeploy_app.code_deploy_app.name
  deployment_group_name  = var.deployment_group_name
  service_role_arn       = aws_iam_role.code_deploy.arn
  deployment_config_name = aws_codedeploy_deployment_config.deployment_config.id

  auto_rollback_configuration {
    enabled = true
    events  = ["DEPLOYMENT_STOP_ON_ALARM"]
  }

  alarm_configuration {
    alarms  = ["${var.deployment_group_name}-alarm"]
    enabled = true
  }

  deployment_style {
    deployment_option = "WITH_TRAFFIC_CONTROL"
    deployment_type   = "BLUE_GREEN"
  }

  trigger_configuration {
    trigger_events     = ["DeploymentFailure"]
    trigger_name       = var.trigger_name
    trigger_target_arn = data.aws_sns_topic.sns_topic.arn
  }



  tags = var.deployment_tags
}