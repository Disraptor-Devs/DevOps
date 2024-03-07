provider "aws" {
  region = var.region

  default_tags {
    tags = var.eventBridge_tags
  }

  ignore_tags {
    keys = ["CreatorId", "CreatorName"]
  }
}