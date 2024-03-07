provider "aws" {
  region = "af-south-1"

  default_tags {
    tags = {
      "automation" = "terraform",
      "owner"      = "diraptor "
    }
  }

  ignore_tags {
    keys = ["CreatorId", "CreatorName"]
  }
}