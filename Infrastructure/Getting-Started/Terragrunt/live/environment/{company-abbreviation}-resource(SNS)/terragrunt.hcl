# Include all settings from the root terragrunt.hcl
include "root" {
  path = find_in_parent_folders()
}

# local variables defined below 
locals {
  # load account vars
  base_vars = read_terragrunt_config(find_in_parent_folders("base_details.hcl"))

  aws_region   = local.base_vars.locals.region
  owner        = local.base_vars.locals.owner
  resource     = local.base_vars.locals.resource
  environment  = local.base_vars.locals.environment
  application  = local.base_vars.locals.application
  purpose      = local.base_vars.locals.purpose
  project-name = local.base_vars.locals.project-name

  project      = "${local.project-name}-SNS"
  name_prefix  = "${local.application}-${local.environment}-${local.project-name}"
  default_tags = local.base_vars.locals.default_tags



  sns_tags = merge(local.default_tags, {
    "project-name" = local.project
    "owner"        = local.account_owner
    "application"  = local.application
    "environment"  = local.environment
    "resource"     = local.resource
    "purpose"      = ""
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