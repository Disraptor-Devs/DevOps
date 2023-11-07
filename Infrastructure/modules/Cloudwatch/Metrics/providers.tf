provider "aws" {
  region = var.region

  default_tags {
    tags = var.metric_alarm_tags
  }

  ignore_tags {
    keys = ["CreatorId", "CreatorName"]
  }
}