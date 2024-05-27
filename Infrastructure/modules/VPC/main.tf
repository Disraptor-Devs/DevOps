resource "aws_vpc" "aws_vpc" {
  cidr_block       = var.cidr_block
  instance_tenancy = var.instance_tenancy

  tags = var.vpc_tags
}

# Subnets code
resource "aws_subnet" "aws_subnet" {
  count             = var.subnet_count
  vpc_id            = aws_vpc.aws_vpc.id
  cidr_block        = var.subnets_cidr[count.index]
  availability_zone = var.availability_zone[count.index]


  tags = var.subnet_tags[count.index]

  map_public_ip_on_launch = var.map_public_ip_on_launch
}


# Route Table

resource "aws_route_table" "route_table" {
  count  = var.subnet_count
  vpc_id = aws_vpc.aws_vpc.id

  dynamic "route" {
    for_each = var.routes
    content {
      cidr_block = route.value.cidr_block
      gateway_id = route.value.gateway_id
    }
  }

  tags = var.routes_tags[count.index]
}

resource "aws_route_table_association" "subnet1_association" {
  count          = var.subnet_count
  subnet_id      = aws_subnet.aws_subnet[count.index].id
  route_table_id = aws_route_table.route_table[count.index].id
}
