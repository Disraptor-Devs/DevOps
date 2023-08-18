provider "aws" {
  region  = var.region
  
  default_tags {
    tags = var.s3_tags
  }

  ignore_tags {
    keys = ["CreatorId", "CreatorName"]
  }
}