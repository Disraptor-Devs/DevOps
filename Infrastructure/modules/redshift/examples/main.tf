
module "redshift_cluster" {
  source = "../module" 

  cluster_identifier                  = "test"
  database_name                       = "mydb"
  port                                = 5439
  master_username                     = "my_master_user"
  master_password                     = "MySecurePassword123"
  node_type                           = "dc2.large"
  cluster_type                        = "single-node"
  number_of_nodes                     = 1
  automated_snapshot_retention_period = 1

  publicly_accessible       = true
  vpc_security_group_ids    = []
  cluster_subnet_group_name = aws_redshift_subnet_group.foo.name
  iam_roles                 = []

  snapshot_cluster_identifier = null

  tags = {
    Name        = "test-clust"
    Environment = "dev"
    Project     = "MyProject"
  }

}

data "aws_vpc" "default" {
  default = true
}

data "aws_subnet" "default_us_east_2a" {
  vpc_id            = data.aws_vpc.default.id
  availability_zone = "us-east-2a"
}

data "aws_subnet" "default_us_east_2b" {
  vpc_id            = data.aws_vpc.default.id
  availability_zone = "us-east-2b"
}

resource "aws_redshift_subnet_group" "foo" {
  name       = "foo"
  subnet_ids = [
    data.aws_subnet.default_us_east_2a.id,
    data.aws_subnet.default_us_east_2b.id
  ]

  tags = {
    environment = "test"
  }
}


