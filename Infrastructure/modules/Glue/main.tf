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

resource "aws_iam_role_policy_attachment" "glue_glueServiceRole_Attachement" {
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSGlueServiceRole"
  role       = aws_iam_role.iamrole.name
}

resource "aws_iam_role_policy_attachment" "glue_kinesis_policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonKinesisFullAccess"
  role       = aws_iam_role.iamrole.name
}

resource "aws_iam_role_policy_attachment" "glue_s3_policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
  role       = aws_iam_role.iamrole.name
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
  name          = var.glue_table_name
  database_name = aws_glue_catalog_database.catalog_db.name
}

resource "aws_glue_crawler" "glue_crawler" {
  database_name = aws_glue_catalog_database.catalog_db.name
  name          = var.glue_crawler_name
  role          = aws_iam_role.iamrole.arn
  schedule      = var.crawler_cron_schedule

  recrawl_policy {
    recrawl_behavior = var.recrawl_behavior # CRAWL_EVERYTHING
  }

  schema_change_policy {
    delete_behavior = var.schema_change_delete_behavior
  }

  dynamic "s3_target" {
    for_each = var.is_s3_target ? [1] : []
    content {
      path = var.s3_bucket_path
    }
  }

  dynamic "jdbc_target" {
    for_each = var.is_jdbc_target ? [1] : []
    content {
      connection_name = var.crawler_jdbc_connection_name
      path            = var.crawler_jdbc_path
    }
  }

  dynamic "catalog_target" {
    for_each = var.is_catalog_target ? [1] : []
    content {
      database_name = aws_glue_catalog_database.catalog_db.name
      tables        = [aws_glue_catalog_table.catalog_table.name]
    }
  }
}

resource "aws_glue_dev_endpoint" "dev_endpoint" {
  count    = var.is_glue_dev_endpoint ? 1 : 0
  name     = var.glue_dev_endpoint_name
  role_arn = aws_iam_role.iamrole.arn
}


resource "aws_glue_connection" "glue_connect" {
  count = var.is_glue_connection ? 1 : 0

  connection_properties = {
    JDBC_CONNECTION_URL = var.glue_connection_jdbc_connection_url
    PASSWORD            = var.glue_connection_password
    USERNAME            = var.glue_connection_username
  }

  name = var.glue_connection_name

  physical_connection_requirements {
    availability_zone      = var.physical_conn_availability_zone
    security_group_id_list = [var.physical_conn_security_group_id]
    subnet_id              = var.physical_conn_subnet_id
  }
}


