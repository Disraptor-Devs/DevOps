resource "aws_ecr_repository" "my_ecr_repository" {
  name                 = "jenkins-repo"
  image_tag_mutability = "MUTABLE"

  tags = {
    Name         = "jenkins-repo",
    "purpose"    = "Jenkins Image repo"
    "owner"      = "Shibule"
    "automation" = "terraform"
  }

}


data "aws_iam_policy_document" "ecr_policy" {
  statement {
    sid    = "ecr policy : ${aws_ecr_repository.my_ecr_repository.name}"
    effect = "Allow"

    principals {
      type        = "AWS"
      identifiers = ["*"]
    }

    actions = [
      "ecr:*"
    ]
  }
}

resource "aws_ecr_repository_policy" "my_policy" {
  repository = aws_ecr_repository.my_ecr_repository.name
  policy     = data.aws_iam_policy_document.ecr_policy.json
}