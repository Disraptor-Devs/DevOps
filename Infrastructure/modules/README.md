Terraform Modules
=====================

In here, we've declared the reusable terraform modules that will be used/referenced in our terragrunt config.

Folder Structure
----------------

Below is how our terraform module folder structure will be defined:

```text
.
├── README.md
├── main.tf
├── outputs.tf
├── providers.tf
├── variables.tf
└── versions.tf
```

Each module must have a **README.md** file included in the folder which holds documentation relating to the inputs(variables),outputs,versions,providers and the resources that can be provisioned with use of the module.

To generate the read me file make use of this command while you're in the directory of the module:

```bash
terraform-docs markdown --sort-by required . > README.md
```
