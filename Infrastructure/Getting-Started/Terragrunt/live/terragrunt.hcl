locals {
  # account level variables 
  base_vars = read_terragrunt_config(find_in_parent_folders("base_details.hcl"))

  # extracting variables for access
  aws_default_region = local.base_vars.locals.region
  environment        = local.base_vars.locals.environment
  application        = local.base_vars.locals.application
  resource           = local.base_vars.locals.resource
  owner              = local.base_vars.locals.owner
  project-name       = local.base_vars.locals.project-name
}

# Configure Terragrunt to automatically store tfstate files in an S3 bucket
remote_state {
  backend = "s3"
  config = {
    bucket         = "${local.project-name}-${local.application}-${local.environment}-terraform-state"
    key            = "${path_relative_to_include()}/terraform.tfstate"
    region         = local.aws_default_region
    encrypt        = true
    dynamodb_table = "terraform-${local.environment_prefix}-locks"
    s3_bucket_tags = {
      "environment"  = "${local.environment}"
      "automation"   = "terragrunt"
      "project-name" = "${local.project-name}"
      "owner"        = "${local.owner}"
      "application"  = "s3:dynamodb"
      Name           = "${local.application}-${local.environment}-${local.project-name}"
    }
    dynamodb_table_tags = {
      "environment"  = "${local.environment}"
      "automation"   = "terragrunt"
      "project-name" = "${local.project_name}"
      "owner"        = "${local.company_name}"
      "application"  = "s3:dynamodb"
      Name           = "${local.application}-${local.environment}-${local.project-name}-lock"
    }
  }
}

# skip = true

# Configure Terragrunt to load default values for common environment variables
terraform {
  # Format Terragrunt's hcl files
  before_hook "before_hook_terragrunt_format" {
    commands = ["plan", "apply"]
    execute  = ["terragrunt", "hclfmt"]
  }

  # Validate Terraform files to check that a configuration is syntactically valid and internally consistent
  before_hook "before_hook_validate" {
    commands = ["plan", "apply"]
    execute  = ["terraform", "validate"]
  }

  # Force Terraform to keep trying to acquire a lock for up to 5 minutes if someone else already has the lock
  extra_arguments "retry_lock" {
    commands  = get_terraform_commands_that_need_locking()
    arguments = ["-lock-timeout=5m"]
  }

}
# so we want users to pick and choose what resources to run, and in what order and what needs to be connected

inputs = merge(
  local.base_vars.locals,
)