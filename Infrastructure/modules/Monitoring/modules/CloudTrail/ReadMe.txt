This README provides an overview of the infrastructure configuration and how to use it effectively.

Introduction
The infrastructure configuration in this repository is designed to provision CloudTrail for resources in AWS. It includes resources for managing log groups related to Lambda functions, DocumentDB, API Gateway, AWS Backup, and S3 buckets.

Prerequisites
Before using this infrastructure configuration, ensure you have the following prerequisites:

An AWS account with appropriate permissions to create and manage the resources defined in this configuration.
Terraform installed on your local machine or CI/CD environment.
Configuration Structure
The configuration consists of Terraform files structured as follows:

main.tf: Defines the resources to be provisioned, including CloudWatch Log Groups for various services, allows to conditionally provion resources by assigning a 1 or 0 as variables
variables.tf: Defines input variables used in the configuration, such as environment, stage, and boolean flags to enable/disable resource creation.
outputs.tf: Defines outputs of provisioned resources such as ARN's, ID,s etc..
Usage
Follow these steps to use the infrastructure configuration:

Clone the repository to your local machine or CI/CD environment.

Modify the variables.tf file to customize the configuration according to your requirements. Update variables such as environment, stage, and boolean flags (create_lambda_logs_function1, create_lambda_logs_function2, etc.) to control which resources are provisioned.

Modify Main.tf to configure resources differently

Initialize the Terraform configuration by running:


terraform init
Review the execution plan to ensure that Terraform will create the intended resources:


terraform plan
Apply the Terraform configuration to provision the resources:


terraform apply
After applying the configuration, Terraform will output any relevant information, such as resource IDs or ARNs. Verify that the resources have been created as expected.

Cleanup
To destroy the resources provisioned by Terraform and clean up the environment, run:


terraform destroy
Confirm the destruction when prompted.

Notes
Ensure that you have proper permissions and credentials configured to access your AWS account.
Review the Terraform documentation for more advanced usage and best practices.