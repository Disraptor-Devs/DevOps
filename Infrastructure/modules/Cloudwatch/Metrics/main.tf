data "aws_iam_policy_document" "streams_assume_role" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["streams.metrics.cloudwatch.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

resource "aws_iam_role" "metric_stream_role" {
  name               = var.metric_stream_iam_role_name
  assume_role_policy = data.aws_iam_policy_document.streams_assume_role.json
}

data "aws_iam_policy_document" "metric_stream_to_firehose" {
  statement {
    effect = "Allow"

    actions = [
      "firehose:PutRecord",
      "firehose:PutRecordBatch",
    ]

    resources = [var.firehose_delivery_stream_arn]
  }
}

resource "aws_iam_role_policy" "metric_stream_to_firehose_policy_attachment" {
  role   = aws_iam_role.metric_stream_role.id
  policy = data.aws_iam_policy_document.metric_stream_to_firehose.json
}

resource "aws_iam_role_policy_attachment" "eventBridge__policy" {
  for_each   = var.policy_arns
  policy_arn = each.value
  role       = aws_iam_role.metric_stream_role.name
  depends_on = [ aws_iam_role.metric_stream_role ]
}


resource "aws_cloudwatch_metric_alarm" "metric_alarm" {
  alarm_name                = var.metric_alarm_name
  alarm_description         = var.metric_alarm_description
  comparison_operator       = var.metric_alarm_comparison_operator
  evaluation_periods        = var.metric_alarm_evaluation_periods
  metric_name               = var.metric_name
  namespace                 = var.metric_alarm_namespace
  period                    = var.metric_alarm_period
  statistic                 = var.metric_alarm_statistic
  threshold                 = var.metric_alarm_threshold
  insufficient_data_actions = var.metric_alarm_insufficient_data_actions

  tags = merge(var.metric_alarm_tags)
}

resource "aws_cloudwatch_metric_stream" "metric_stream" {
  name          = var.metric_stream_name
  role_arn      = aws_iam_role.metric_stream_role.arn
  firehose_arn  = var.firehose_delivery_stream_arn
  output_format = var.metric_stream_output_format

  dynamic "include_filter" {
    for_each = var.metric_stream_filters
    content {
      namespace    = each.key
      metric_names = each.value
    }
  }

  tags = merge(var.metric_alarm_tags)
}

resource "aws_cloudwatch_composite_alarm" "composite_alarm" {
  count = var.is_create_composite_alarm ? 1 : 0

  alarm_name        = var.composite_alarm_name
  alarm_description = var.composite_alarm_description
  alarm_actions     = var.alarm_actions_arns
  ok_actions        = var.ok_actions_arns

  actions_enabled = var.is_actions_enabled

  alarm_rule = var.composite_alarm_rule

  dynamic "actions_suppressor" {
    for_each = var.is_action_suppresor ? [1] : []
    content {
      alarm            = var.actions_suppressor_alarm_name_or_arn
      extension_period = var.actions_suppressor_extension_period
      wait_period      = var.actions_suppressor_wait_period
    }
  }
  tags = merge(var.metric_alarm_tags)
}