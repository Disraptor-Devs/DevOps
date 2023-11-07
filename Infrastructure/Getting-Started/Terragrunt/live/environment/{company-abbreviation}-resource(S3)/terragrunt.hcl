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

  project      = "${local.project-name}-S3"
  name_prefix  = "${local.application}-${local.environment}-${local.project-name}"
  default_tags = local.base_vars.locals.default_tags


  s3_tags = merge(local.default_tags, {
    "project-name" = local.project
    "owner"        = local.account_owner
    "application"  = local.application
    "environment"  = local.environment
    "resource"     = local.resource
    "purpose"      = ""
  })


  s3_bucket_name                = ""
  s3_policy_actions             = ["s3:*"]
  is_bucket_notification        = true
  s3_bucket_notification_events = ["s3:ObjectCreated:*", "s3:ObjectRemoved:*"]
  s3_identifiers                = []
}

# Terragrunt will copy the Terraform configurations specified by the source parameter, along with any files in the
# working directory, into a temporary folder, and execute your Terraform commands in that folder.
terraform {
  source = "git::https://github.com/Disraptor-Devs/DevOps.git//Infrastructure/modules/S3?ref=dev"
}

dependency "sns_topic" {
  config_path = "../path/to/sns/folder"

  mock_outputs = {
    sns_topic_arn = "fake-sns-arn"
  }
}

inputs = {
  s3_bucket_name                = local.s3_bucket_name
  s3_identifiers                = local.s3_identifiers
  s3_policy_actions             = local.s3_policy_actions
  is_bucket_notification        = local.is_bucket_notification
  s3_bucket_notification_events = local.s3_bucket_notification_events
  sns_topic_arn                 = dependency.sns_topic.outputs.sns_topic_arn
  s3_tags                       = local.s3_tags
  region                        = local.aws_region
}