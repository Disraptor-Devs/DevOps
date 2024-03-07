locals {
  project-name = ""
  owner        = ""
  resource     = ""
  application  = ""
  environment  = ""
  region       = ""
  default_tags = {
    "owner"       = local.owner
    "environment" = local.environment
    "automation"  = "terraform"
  }
}