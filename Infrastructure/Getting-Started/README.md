# Getting Started

The purpose of this repo is to serve as a quick start guide for our engineers; to ensure efficiency and productivity. And it will further expand with time to include more content depending on the technologies and processes we choose to utilise.

## Terragrunt

This quick start guide will include how DevOps engineers should have their folders structured, the base and root terragrunt files that must sit at the root of the project, the naming convention  and how the master delegator yaml file must be set up.

Below is how we should have our folder structure laid out:

```text
.
└── live
    ├── base_terragrunt.hcl
    ├── environment
    │   ├── master-delegator
    │   │   ├── ansible.cfg
    │   │   └── delegator.yml
    │   ├── {company-abbreviation}-resource(S3)
    │   │   └── terragrunt.hcl
    │   └── {company-abbreviation}-resource(SNS)
    │       └── terragrunt.hcl
    └── terragrunt.hcl
```

- **"live/"** is our root folder that will hold our terragrunt config.
- **"environemnt/"** represents the environment in which the terragrunt config will be applied (e.g. production, integration, development).
- **"master-delegator/"** this folder holds the delegator.yaml file which is responsible for specifying the order in which we run our terragrunt config. The delegator file is necessary for our process and relies on the terragrunt_runner ansible role.
- **"{company-abbreviation}-resource"** This represent the folders inside the environment folder which will hold terragrunt config. The naming convention to be followed is company-abbreviation followed by the AWS resource we're provisioning in the terragrunt config. The company-abbreviation should be declared in the base_terragrunt.hcl file. (e.g. dsrptr-S3)
- **"base_terragrunt.hcl"** is the file in which we'll declare global variables as well as the default tags that will be used/referenced within our root terragrunt file and the other terragrunt files.
- **terragrunt.hcl** is the root terragrunt file. This is necessary to have in your root folder. The root terragrunt file is responsible for setting up the S3 bucket in which we'll store our terraform state, as well as create the terraform state and the terraform lock that will be stored in DynamoDB. This file is to be included in each terragrunt file we create to provision infrastructure.
