locals {
  company_name          = ""
  company_abbreviation  = ""
  region                = ""
  environment           = ""
  environment_prefix    = ""
  application_namespace = ""
  account_owner         = ""
  default_tags = {
    "${local.company_abbreviation}:environment" = local.environment
    "${local.company_abbreviation}:automation"  = "terraform"
  }
}