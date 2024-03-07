terraform {
  # Require any 1.0.x version of Terraform
  required_version = ">= 1.0.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 2.70.0"
    }
  }

  # Partial configuration, intentionally left empty. The other settings (e.g., bucket, region) will be
  # passed in from the terragrunt.hcl file via -backend-config arguments to 'terraform init'
  backend "s3" {
    bucket         = "disraptor-prod-terraform-state"
    key            = "production/jenkins-s3/terraform.tfstate"
    region         = "af-south-1"
    dynamodb_table = "terraform-prod-locks"
  }
}