data "aws_iam_policy_document" "sns_publish_policy" {
  count = var.create_sns_publish_policy ? 1 : 0

  statement {
    actions   = ["sns:Publish"]
    resources = var.create_sns_publish_policy ? [aws_sns_topic.admin_topic.arn, aws_sns_topic.dev_topic.arn] : []

    principals {
      type        = "Service"
      identifiers = var.create_sns_publish_policy ? ["cloudwatch.amazonaws.com"] : []
    }
  }
}

resource "aws_sns_topic" "admin_topic" {
  name = "admin-topic"
  # other attributes...
}

resource "aws_sns_topic" "dev_topic" {
  name = "dev-topic"
  # other attributes...
}

resource "aws_sns_topic_policy" "admin_topic_policy" {
  count = var.create_sns_publish_policy ? 1 : 0
  arn   = var.create_sns_publish_policy ? aws_sns_topic.admin_topic.arn : null
  policy = var.create_sns_publish_policy ? data.aws_iam_policy_document.sns_publish_policy[0].json : null
}

resource "aws_sns_topic_policy" "dev_topic_policy" {
  count = var.create_sns_publish_policy ? 1 : 0
  arn   = var.create_sns_publish_policy ? aws_sns_topic.dev_topic.arn : null
  policy = var.create_sns_publish_policy ? data.aws_iam_policy_document.sns_publish_policy[0].json : null
}
