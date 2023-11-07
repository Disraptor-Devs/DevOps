provider "aws" {
  region = var.region

  default_tags {
    tags = var.tags
  }

  ignore_tags {
    keys = ["CreatorId", "CreatorName"]
  }
}