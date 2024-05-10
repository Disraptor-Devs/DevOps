data "aws_iam_policy_document" "cw_log_role_doc" {
  statement {
    effect  = "Allow"
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["logs.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "cw_log_role" {
  name               = var.cw_log_role_name
  assume_role_policy = data.aws_iam_policy_document.cw_log_role_doc.json
}

resource "aws_iam_role_policy_attachment" "cw_log_kinesis_policy" {
  for_each   = var.policy_arns
  policy_arn = each.value
  role       = aws_iam_role.cw_log_role.name
  depends_on = [aws_iam_role.cw_log_role]
}


resource "aws_kms_key" "bucket_kms_key" {
  count               = var.is_kms_key ? 1 : 0
  description         = "KMS key for ${var.log_group_name}"
  enable_key_rotation = true
  # auto renewal 

  tags = merge(var.log_tags)
}

resource "aws_cloudwatch_log_group" "log_group" {
  name              = var.log_group_name
  retention_in_days = var.log_group_retention_in_days
  kms_key_id        = var.is_kms_key ? aws_kms_key.bucket_kms_key[0].arn : null
  tags              = var.log_tags
}

resource "aws_cloudwatch_log_stream" "log_stream" {
  count          = var.is_log_stream ? 1 : 0
  name           = var.log_stream_name
  log_group_name = aws_cloudwatch_log_group.log_group.name
}

resource "aws_cloudwatch_log_subscription_filter" "log_subscription_filter" {
  count           = var.is_log_subscription_filter ? 1 : 0
  name            = var.log_subscription_filter_name
  log_group_name  = aws_cloudwatch_log_group.log_group.name
  filter_pattern  = var.log_subscription_filter_pattern
  destination_arn = var.log_subscription_filter_destination_arn
}

resource "aws_cloudwatch_log_metric_filter" "metric_filter" {
  count          = var.is_log_metric_filter ? 1 : 0
  name           = var.log_metric_filter_name
  pattern        = var.log_metric_filter_pattern
  log_group_name = aws_cloudwatch_log_group.log_group.name

  metric_transformation {
    name      = var.metric_tranformation_name
    namespace = var.metric_tranformation_namespace
    value     = var.metric_tranformation_value
  }
}


resource "aws_cloudwatch_log_destination" "cw_log_destination" {
  count      = var.is_log_destination ? 1 : 0
  name       = var.log_destination_name
  role_arn   = aws_iam_role.iam_for_cloudwatch.arn
  target_arn = aws_kinesis_stream.kinesis_for_cloudwatch.arn
}

data "aws_iam_policy_document" "log_destination_policy" {
  statement {
    effect  = "Allow"
    actions = ["logs:*"]

    principals {
      type        = "AWS"
      identifiers = ["logs.amazonaws.com"]
    }

    resources = [aws_cloudwatch_log_destination.cw_log_destination.arn]
  }
}

resource "aws_cloudwatch_log_destination_policy" "log_destination_policy" {
  count            = var.is_log_destination ? 1 : 0
  destination_name = aws_cloudwatch_log_destination.cw_log_destination.name
  access_policy    = data.aws_iam_policy_document.log_destination_policy.json
}