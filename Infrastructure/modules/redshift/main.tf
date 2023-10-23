resource "aws_kms_key" "kms_key" {
  description         = "KMS key for ${var.database_name}"
  enable_key_rotation = true
  # auto renewal 

  tags = merge(var.tags)
}

data "aws_iam_policy_document" "redshift_iamrole_policy" {
  statement {
    effect  = "Allow"
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["redshift.amazonaws.com"]
    }
  }
}

resource "aws_iam_role_policy_attachment" "redshift_glue_service_role_Attachement" {
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSGlueServiceRole"
  role       = aws_iam_role.iamrole.name
}

resource "aws_iam_role_policy_attachment" "redshift_s3_policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
  role       = aws_iam_role.iamrole.name
}

resource "aws_iam_role_policy_attachment" "redshift_event_bridge_policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEventBridgeFullAccess"
  role       = aws_iam_role.iamrole.name
}

resource "aws_iam_role_policy_attachment" "redshift_lambda_policy" {
  policy_arn = "arn:aws:iam::aws:policy/AWSLambdaFullAccess"
  role       = aws_iam_role.iamrole.name
}

resource "aws_iam_role" "iamrole" {
  name               = var.redshift_iam_role_name
  assume_role_policy = data.aws_iam_policy_document.redshift_iamrole_policy.json
}

resource "aws_redshift_cluster" "redshift" {
  cluster_identifier                  = var.cluster_identifier
  database_name                       = var.database_name
  port                                = var.port
  master_username                     = var.master_username
  master_password                     = var.master_password
  node_type                           = var.node_type
  cluster_type                        = var.cluster_type
  number_of_nodes                     = var.number_of_nodes
  automated_snapshot_retention_period = var.automated_snapshot_retention_period

  kms_key_id = aws_kms_key.kms_key.arn

  publicly_accessible       = var.publicly_accessible
  vpc_security_group_ids    = var.vpc_security_group_ids
  cluster_subnet_group_name = var.cluster_subnet_group_name
  iam_roles                 = [aws.aws_iam_role.iamrole.arn]

  snapshot_cluster_identifier = var.snapshot_cluster_identifier

  tags = var.tags

}
