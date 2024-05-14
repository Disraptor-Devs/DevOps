provider "aws" {
  region = "eu-central-1"

  default_tags {
    tags = {
      "automation"  = "terraform",
      "environment" = "prod",
      "owner"       = "diraptor "
    }
  }

  ignore_tags {
    keys = ["CreatorId", "CreatorName"]
  }
}