provider "aws" {
  region = var.region

  default_tags {
    tags = var.sns_tags
  }

  ignore_tags {
    keys = ["CreatorId", "CreatorName"]
  }
}