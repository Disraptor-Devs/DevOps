provider "aws" {
  region = var.region

  default_tags {
    tags = var.api_gateway_tags
  }

  ignore_tags {
    keys = ["CreatorId", "CreatorName"]
  }
}