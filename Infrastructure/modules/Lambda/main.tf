data "aws_iam_policy_document" "assume_role" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

resource "aws_iam_role" "iam_for_lambda" {
  name               = var.lambda_iam_role_name
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
  
  tags = merge(var.lambda_tags)
}

resource "aws_iam_role_policy_attachment" "lambda_kinesis_policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonKinesisFullAccess"
  role       = aws_iam_role.iam_for_lambda.name
}

resource "aws_iam_role_policy_attachment" "laambda_s3_policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
  role       = aws_iam_role.iam_for_lambda.name
}

resource "aws_iam_role_policy_attachment" "laambda_s3_policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonSNSFullAccess"
  role       = aws_iam_role.iam_for_lambda.name
}

data "archive_file" "lambda" {
  count = var.is_deployment_package_local ? 1 : 0 

  type        = var.archive_type
  source_file = var.path_to_code
  output_path = var.output_path
}

resource "aws_lambda_function" "lambda_function" {
  # If the file is not in the current working directory you will need to include a
  # path.module in the filename.
  filename      = var.output_path
  function_name = var.function_name
  description   = var.function_description 
  role          = aws_iam_role.iam_for_lambda.arn
  handler       = var.lambda_handler 
  
  s3_bucket = !var.is_deployment_package_local ? var.s3_bucket_for_lambda : null
  s3_key    = !var.is_deployment_package_local ? var.s3_key_to_code_for_lambda : null

  source_code_hash = var.is_deployment_package_local ? data.archive_file.lambda[0].output_base64sha256 : null

  runtime = var.lambda_function_runtime

  dynamic "environment" {
    for_each = var.is_function_variables ? [1] : []
    content {
      variables = var.lambda_variables
    } 
  }

  tags = merge(var.lambda_tags)
}

resource "aws_lambda_alias" "lambda_alias" {
  name             = var.lambda_alias_name
  description      = var.lambda_alias_description
  function_name    = aws_lambda_function.lambda_function.arn
  function_version = var.lambda_alias_function_version

#   routing_config {
#     additional_version_weights = {
#       "2" = 0.5
#      }
#   } 

  tags = merge(var.lambda_tags)
}

# still undecided on whether this feature will be added or not 

# resource "aws_lambda_function_event_invoke_config" "example" {
#   function_name = aws_lambda_alias.lambda_alias.function_name

#   destination_config {
#     on_failure {
#       destination = var.sns_topic_arn
#     }

#     on_success {
#       destination = var.sns_topic_arn
#     }
#   }
# }

resource "aws_lambda_event_source_mapping" "event_source_kinesis" {
  count = var.is_kinesis_event_source ? 1 : 0 

  event_source_arn            = var.kinesis_stream_arn
  function_name               = aws_lambda_function.lambda_function.arn
  starting_position           = var.event_starting_position
  starting_position_timestamp = var.event_starting_position == "AT_TIMESTAMP" ? var.starting_pos_timestamp : null 

  destination_config {
    on_failure {
      destination_arn = var.sns_failure_topic_arn
    }
  }
}

resource "aws_lambda_event_source_mapping" "event_source_msk" {
  count = var.is_msk_cluster_event_source ? 1 : 0

  event_source_arn  = var.msk_cluster_arn
  function_name     = aws_lambda_function.lambda_function.arn
  topics            = var.msk_topics
  starting_position = var.event_starting_position  

  dynamic "amazon_managed_kafka_event_source_config" {
    for_each = var.is_kafka_event_source_config ? [1] : []
    content {
      consumer_group_id = var.managed_kafka_consumer_group_id  
    }
  }
}

resource "aws_lambda_permission" "allow_s3" {
  count = var.is_allow_s3_action_on_lambda ? 1 : 0

  statement_id  = var.lambda_permission_statement_id
  action        = var.lambda_permission_action
  function_name = aws_lambda_function.lambda_function.function_name
  principal     = "s3.amazonaws.com"
  source_arn    = var.s3_bucket_arn
  qualifier     = aws_lambda_alias.lambda_alias.name  
}

resource "aws_lambda_permission" "allow_cloudwatch" {
  count = var.is_allow_cloudwatch_action_on_lambda ? 1 : 0

  statement_id  = var.lambda_permission_statement_id
  action        = var.lambda_permission_action
  function_name = aws_lambda_function.lambda_function.function_name
  principal     = "events.amazonaws.com"
  source_arn    = var.cloudwatch_arn
  qualifier     = aws_lambda_alias.lambda_alias.name  
}

resource "aws_lambda_permission" "allow_sns" {
  count = var.is_allow_sns_action_on_lambda ? 1 : 0

  statement_id  = var.lambda_permission_statement_id
  action        = var.lambda_permission_action
  function_name = aws_lambda_function.lambda_function.function_name
  principal     = "sns.amazonaws.com"
  source_arn    = var.sns_arn
  qualifier     = aws_lambda_alias.lambda_alias.name  
}

resource "aws_lambda_provisioned_concurrency_config" "concurrency_allocation" {
  count = var.is_lambda_provisioned_concurrency ? 1 : 0

  function_name                     = aws_lambda_alias.lambda_alias.function_name
  provisioned_concurrent_executions = var.concurrent_excutions
  qualifier                         = aws_lambda_alias.lambda_alias.name
}

resource "aws_lambda_function_url" "lambda_url" {
  count = var.is_lambda_function_url ? 1 : 0

  function_name      = aws_lambda_function.lambda_function.function_name
  authorization_type = var.lambda_function_url_auth_type 

  cors {
    allow_credentials = var.lambda_function_url_cors_allow_credentials
    allow_origins     = var.lambda_function_url_cors_allow_origins 
    allow_methods     = var.lambda_function_url_cors_allow_methods
    allow_headers     = var.lambda_function_url_cors_allow_headers  
    expose_headers    = var.lambda_function_url_cors_expose_headers
    max_age           = var.lambda_function_url_cors_max_age  
  }
}