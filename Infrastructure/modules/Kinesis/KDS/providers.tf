provider "aws" {
  region  = var.region
  
  default_tags {
    tags = var.kds_tags
  }

  ignore_tags {
    keys = ["CreatorId", "CreatorName"]
  }
}