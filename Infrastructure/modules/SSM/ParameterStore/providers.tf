provider "aws" {
  region = var.region

  default_tags {
    tags = var.ssm_parameter_tags
  }

  ignore_tags {
    keys = ["CreatorId", "CreatorName"]
  }
}