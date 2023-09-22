provider "aws" {
  region = var.region

  default_tags {
    tags = var.glue_tags
  }

  ignore_tags {
    keys = ["CreatorId", "CreatorName"]
  }
}