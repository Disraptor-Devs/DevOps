provider "aws" {
  region = var.region

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
