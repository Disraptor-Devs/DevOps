provider "aws" {
  region = var.region

  default_tags {
    tags = var.lambda_tags
  }

  ignore_tags {
    keys = ["CreatorId", "CreatorName"]
  }
}