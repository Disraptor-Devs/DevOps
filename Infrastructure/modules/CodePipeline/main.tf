data "aws_iam_policy_document" "assume_role" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["codepipeline.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}



resource "aws_iam_role" "codepipeline_role" {
  name               = var.code_pipeline_role_name
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
}



resource "aws_iam_role_policy_attachment" "lf_access" {
  policy_arn = "arn:aws:iam::837188172098:policy/lf-pipeline-cicd-${var.environment}"
  role       = aws_iam_role.codepipeline_role.name
}



resource "aws_codepipeline" "code_pipeline" {
  name     = var.code_pipeline_name
  role_arn = aws_iam_role.codepipeline_role.arn

  artifact_store {
    location = var.code_pipeline_artifact_store_bucket
    type     = "S3"
  }

  stage {
    name = "Source"

    action {
      name             = "Source"
      category         = "Source"
      owner            = "AWS"
      provider         = "CodeCommit"
      version          = "1"
      region           = var.region
      output_artifacts = ["source_output"]
      configuration = {
        RepositoryName = var.code_commit_repository_name
        BranchName     = var.code_commit_branch_name
      }

    }

  }

  stage {
    name = "Build"

    action {
      name            = "Build"
      category        = "Build"
      owner           = "AWS"
      provider        = "CodeBuild"
      region          = var.region
      input_artifacts = ["source_output"]
      version         = "1"
      configuration = {
        ProjectName = var.code_build_project_name
      }
    }

  }


  tags = var.code_pipeline_tags
}


