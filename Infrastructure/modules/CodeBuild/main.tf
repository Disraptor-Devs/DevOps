data "aws_iam_policy_document" "assume_role" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["codebuild.amazonaws.com"]
    }
  }

}

resource "aws_iam_role" "code_build_role" {
  name               = var.codebuild_iam_role_name
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
}

resource "aws_iam_role_policy_attachment" "s3_access" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
  role       = aws_iam_role.code_build_role.name
}

resource "aws_iam_role_policy_attachment" "logs_access" {
  policy_arn = "arn:aws:iam::aws:policy/CloudWatchLogsFullAccess"
  role       = aws_iam_role.code_build_role.name
}

resource "aws_iam_role_policy_attachment" "lambda_access" {
  policy_arn = "arn:aws:iam::aws:policy/AWSLambda_FullAccess"
  role       = aws_iam_role.code_build_role.name
}


resource "aws_codebuild_project" "code_build" {
  name         = var.code_build_project_name
  description  = "CodeBuild project for the Payments Service"
  service_role = aws_iam_role.code_build_role.arn

  artifacts {
    type = var.code_build_artifact_type
  }

  environment {
    compute_type = "BUILD_GENERAL1_SMALL"
    image        = "aws/codebuild/standard:4.0"
    type         = "LINUX_CONTAINER"
    environment_variable {
      name  = "AWS_DEFAULT_REGION"
      value = var.region
    }
  }

  source {
    type = "NO_SOURCE"
  }

  logs_config {
    cloudwatch_logs {
      group_name  = "/aws/codebuild/${var.code_build_project_name}"
      stream_name = "build"
    }
  }

  tags = var.code_build_tags
}