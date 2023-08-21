provider "aws" {
  region  = var.region
  
  default_tags {
    tags = var.kdf_tags
  }

  ignore_tags {
    keys = ["CreatorId", "CreatorName"]
  }
}