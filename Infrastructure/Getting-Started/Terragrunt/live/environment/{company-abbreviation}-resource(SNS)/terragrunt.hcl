# Include all settings from the root terragrunt.hcl
include "root" {
  path = find_in_parent_folders()
}

# local variables defined below 
locals {
  # load account vars
  base_vars = read_terragrunt_config(find_in_parent_folders("base_details.hcl"))

  aws_region            = local.base_vars.locals.region
  account_owner         = local.base_vars.locals.company_name
  company_identifier    = local.base_vars.locals.company_abbreviation
  environment           = local.base_vars.locals.environment
  environment_prefix    = local.base_vars.locals.environment_prefix
  application_namespace = local.base_vars.locals.application_namespace

  project      = "${local.account_owner}-SNS"
  name_prefix  = "${local.application_namespace}-${local.environment_prefix}-${local.project}"
  default_tags = local.base_vars.locals.default_tags



  sns_tags = merge(local.default_tags, {
    "${local.company_identifier}:project-name"         = local.project
    "${local.company_identifier}:owner"                = local.account_owner
    "${local.company_identifier}:application-services" = "SNS"
    "${local.company_identifier}:purpose"              = ""
  })

  sns_topic_name              = ""
  is_email_subscription       = true
  subscription_email_endpoint = ""

}

# Terragrunt will copy the Terraform configurations specified by the source parameter, along with any files in the
# working directory, into a temporary folder, and execute your Terraform commands in that folder.
terraform {
  source = "git::https://github.com/Disraptor-Devs/DevOps.git//Infrastructure/modules/SNS?ref=dev"
}

inputs = {
  sns_topic_name              = local.sns_topic_name
  sns_tags                    = local.sns_tags
  is_email_subscription       = local.is_email_subscription
  subscription_email_endpoint = local.subscription_email_endpoint
}