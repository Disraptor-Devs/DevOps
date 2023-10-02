Dynamic Cloud Service Orchestration
===================================

Below I'll be outlining what **'Dynamic Cloud Service Orchestration'** is at a high level and how it works

We create re-usable modules in **Terraform** that represent AWS services and resources that will be provisioned within our clients AWS account. These modules will cater to a range of use cases that are related to our VP. They are meant to be very configurable based on the inputs we pass into them. This allows us to break apart things to a modular level and helps us avoid duplication. Allowing us to work efficiently and giving us more time to spend on innovating. With these modules clearly defined, we need a tool that will leverage these terraform modules to allow us to dynamically create resources based on different use cases, And that tool is Terragrunt .

 **Terragrunt** is a thin wrapper for Terraform that allows us to pass in inputs that are specific to different use cases into our defined modules. The inputs are what decide how the created resources will look like once provisioned. Terragrunt grants us additional functionality on top of Terraform hence the choice to make use of it . Both Terraform and Terragrunt are cloud agnostic.  And the last part of our process is orchestration . And for this , we will use **Ansible** to orchestrate our cloud infrastructure.

 We will make use of a **“delegator”** which is an YAML file that will specify the order in which our infrastructure will be provisioned . This provides a way for us to provision the entire infrastructure in an automated way and with one click. All we need to do is specify the order.
This is a high level overview of the entire process . There’s still a lot to unpack with regard.

Folder Structure
----------------

Below is how our terraform module folder structure will be defined (note: this doesn't relate to the ansible roles)

```text
.
├── README.md
├── main.tf
├── outputs.tf
├── providers.tf
├── variables.tf
└── versions.tf
```

Each module must have a README.md file included in the folder which holds documentation relating to the inputs(variables),outputs,versions,providers and the resources that can be provisioned with use of the module.

To generate the read me file make use of this command while you're in the directory of the module:

```bash
terraform-docs markdown --sort-by required . > README.md
```
