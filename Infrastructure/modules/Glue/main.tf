locals {
  is_s3_bucket = !var.is_existing_S3_bucket ? 1 : 0
}


module "s3_bucket" {
  count  = local.is_s3_bucket
  source = "../S3"  
}


data "aws_iam_policy_document" "glue_iamrole" {
  statement {
    effect  = "Allow"
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["glue.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "iamrole" {
  name               = var.glue_iam_role_name
  assume_role_policy = data.aws_iam_policy_document.glue_iamrole.json
}

resource "aws_glue_catalog_database" "catalog_db" {
  name = var.glue_catalog_db_name
  create_table_default_permission {
    permissions = [var.create_table_default_permissions]
    principal {
      data_lake_principal_identifier = var.data_lake_principal_identifier
    }
  }
}

 resource "aws_glue_catalog_table" "catalog_table" {
  name           = var.glue_catalog_table_name
  database_name  = aws_glue_catalog_database.catalog_db.name
  description    = var.glue_catalog_table_description
  owner          = var.glue_catalog_table_owner
  table_type     = var.glue_catalog_table_type
  partition_keys = var.glue_catalog_table_partition_keys
  retention      = var.glue_catalog_table_retention 
}
 
resource "aws_glue_crawler" "glue" {
  database_name = aws_glue_catalog_database.catalog_db.name
  name          = var.glue_crawler_name
  role          = aws_iam_role.iamrole.arn

  dynamic "s3_target" {
    for_each = var.is_s3_target ? [1] : []
    content {
      path = var.is_existing_S3_bucket ? var.s3_bucket_path : module.s3_bucket[0].s3_bucket_path
    }
  }

  dynamic "jdbc_target" {
    for_each = var.is_jdbc_target ? [] : [1]
    content {
      connection_name = "my-jdbc-connection"
      path            = "jdbc_path"
    }
  }
}


resource "aws_glue_job" "example" {
  name     = "example"
  role_arn = aws_iam_role.example.arn

  command {
    script_location = "s3://${aws_s3_bucket.example.bucket}/example.py"
  }
}
