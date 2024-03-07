provider "aws" {
  region = "af-south-1"

  default_tags {
    tags = {
        "automation" = "terraform",
        "environment" = "production",
        "owner" = "Shibule"
    }
  }

  ignore_tags {
    keys = ["CreatorId", "CreatorName"]
  }
}