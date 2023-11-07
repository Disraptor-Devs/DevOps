terraform {
  required_version = ">= 1.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.0"
    }
  }

  # Partial configuration, intentionally left empty. The other settings (e.g., bucket, region) will be
  # passed in from the terragrunt.hcl file via -backend-config arguments to 'terraform init'
  backend "s3" {}
}
