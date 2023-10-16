
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

  publicly_accessible       = var.publicly_accessible
  vpc_security_group_ids    = var.vpc_security_group_ids
  cluster_subnet_group_name = var.cluster_subnet_group_name
  iam_roles                 = var.iam_roles

  snapshot_cluster_identifier = var.snapshot_cluster_identifier

  tags = var.tags

}
