provider "aws" {
  region = var.region

  default_tags {
    tags = var.log_tags
  }

  ignore_tags {
    keys = ["CreatorId", "CreatorName"]
  }
}