Dynamic Cloud Service Orchestration
===================================

Within this repo we define a number of modules that represent services/resources that we work with a lot on AWS on __client projects__ 

This provides us a centralised place to manage modules to be used.

HOW TO GUIDE

---
To make use of the modules within this repo for client projects you would have to do it in the following way

First we define a module that will pull in the devOps repo into our current client project.

```terraform
devops-repo/main.tf

module "main" {
  source = "git::github.com/Disraptor-Devs/DevOps.git?ref=main"
}
```

After this we will make reference to specific modules that are in the devops repo which have been checkout above and pass in values that are expected of that module

```terraform
module "S3" {
  source            = "../../component/s3"
  s3_bucket_name    = "default_bucket"
  s3_policy_actions = ["s3:*]
  s3_tags           = {
    Name = "default_bucket"
    owner = "disraptor"
    environment = production
    automation = terraform 
  }

  is_access_point = true
}
```

The above depicts exactly how to make use of the modules within this repo and how to pass in variables into them.
