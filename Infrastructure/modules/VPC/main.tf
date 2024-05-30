resource "aws_vpc" "aws_vpc" {
  cidr_block       = var.cidr_block
  instance_tenancy = var.instance_tenancy

  tags = var.vpc_tags
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.aws_vpc.id

  tags = var.igw_tags
}

resource "aws_internet_gateway_attachment" "igw_attachment" {
  count               = var.create_igw_attachment ? 1 : 0
  internet_gateway_id = aws_internet_gateway.gw.id
  vpc_id              = aws_vpc.aws_vpc.id
}

# Nat Gateway
# resource "aws_nat_gateway" "public_nat_gw" {
#   allocation_id = var.eip_id
#   subnet_id     = aws_subnet.aws_subnet.id

#   tags       = var.nat_gateway_tags
#   depends_on = [aws_internet_gateway.gw]
# }

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
