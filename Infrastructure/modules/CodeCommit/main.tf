data "aws_codecommit_repository" "repository" {
    repository_name = var.code_commit_repository_name
}

