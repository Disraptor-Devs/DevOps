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

resource "aws_iam_role_policy_attachment" "lf_access" {
  policy_arn = "arn:aws:iam::837188172098:policy/lf-pipeline-cicd-${var.environment}"
  role       = aws_iam_role.code_build_role.name
}


resource "aws_codebuild_project" "code_build" {
  name         = var.code_build_project_name
  description  = "CodeBuild project for the ${var.code_build_project_name}"
  service_role = aws_iam_role.code_build_role.arn

  # artifacts {
  #   type      = "S3"
  #   location  = var.bucket_name
  #   name      = var.artifact_name
  #   packaging = "ZIP"
  # }

  artifacts {
    type = "CODEPIPELINE"
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
    type = "CODEPIPELINE"
  }

  logs_config {
    cloudwatch_logs {
      group_name  = "/aws/codebuild/${var.code_build_project_name}"
      stream_name = "build"
    }
  }



  tags = var.code_build_tags
}