locals {
  for_firehose    = var.is_firehose_subscription ? 1 : 0
  for_application = var.is_application_subscription ? 1 : 0
  for_email       = var.is_email_subscription ? 1 : 0
  for_lambda      = var.is_lambda_subscription ? 1 : 0
  for_sub_role    = var.is_create_subscription_role ? 1 : 0
}

data "aws_iam_policy_document" "subscription_role_policy" {
  count = local.for_sub_role

  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = var.subscription_policy_identifiers
    }

    actions   = var.subscription_policy_doc_actions
    resources = [var.kinesis_delivery_stream_arn]
  }
}

resource "aws_iam_role" "subscription_role" {
  count              = local.for_sub_role
  name               = var.subscription_iam_name
  assume_role_policy = data.aws_iam_policy_document.subscription_role_policy[0].json

  tags = merge(var.sns_tags)
}

resource "aws_sns_topic" "sns_topic" {
  name                        = var.sns_topic_name
  fifo_topic                  = var.is_fifo_topic
  content_based_deduplication = var.is_content_based_deduplication
  kms_master_key_id           = var.is_kms_encryption ?  aws_kms_key.sns_kms_key.id : null
  delivery_policy             = var.delivery_policy

  tags = merge(var.sns_tags)
}

data "aws_iam_policy_document" "policy_doc" {
  policy_id = "${var.sns_topic_name}-policy"
  statement {
    effect = "Allow"

    principals {
      type        = "AWS"
      identifiers = var.policy_identifiers
    }

    actions   = var.policy_doc_actions
    resources = [aws_sns_topic.sns_topic.arn]
  }
}

resource "aws_sns_topic_policy" "topic_policy" {
  arn    = aws_sns_topic.sns_topic.arn
  policy = data.aws_iam_policy_document.policy_doc.json
}

resource "aws_sns_topic_subscription" "subscription_for_firehose" {
  count                 = local.for_firehose
  topic_arn             = aws_sns_topic.sns_topic.arn
  protocol              = "firehose"
  endpoint              = var.kinesis_delivery_stream_arn
  subscription_role_arn = aws_iam_role.subscription_role[0].arn
}

resource "aws_sns_topic_subscription" "subscription_for_application" {
  count     = local.for_application
  topic_arn = aws_sns_topic.sns_topic.arn
  protocol  = "application"
  endpoint  = var.subscription_application_endpoint
}

resource "aws_sns_topic_subscription" "subscription_for_email" {
  count     = local.for_email
  topic_arn = aws_sns_topic.sns_topic.arn
  protocol  = "email"
  endpoint  = var.subscription_email_endpoint
}

resource "aws_sns_topic_subscription" "subscription_for_lambda" {
  count     = local.for_lambda
  topic_arn = aws_sns_topic.sns_topic.arn
  protocol  = "lambda"
  endpoint  = var.subscription_lambda_endpoint
}

resource "aws_kms_key" "sns_kms_key" {
  count               = var.is_kms_encryption ? 1 : 0
  description         = "KMS key for ${var.sns_topic_name}"
  enable_key_rotation = true

  tags = merge(var.sns_tags)
}