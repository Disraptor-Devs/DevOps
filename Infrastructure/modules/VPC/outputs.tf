output "vpc_id" {
  description = "The ID of the VPC"
  value       = aws_vpc.aws_vpc.id
}

output "vpc_arn" {
  description = "The ARN of the VPC"
  value       = aws_vpc.aws_vpc.arn
}

output "vpc_cidr_block" {
  description = "The CIDR block of the VPC"
  value       = aws_vpc.aws_vpc.cidr_block
}

output "vpc_default_network_acl_id" {
  description = "The ID of the default network ACL for the VPC"
  value       = aws_vpc.aws_vpc.default_network_acl_id
}

output "vpc_default_route_table_id" {
  description = "The ID of the default route table for the VPC"
  value       = aws_vpc.aws_vpc.default_route_table_id
}

output "vpc_default_security_group_id" {
  description = "The ID of the default security group for the VPC"
  value       = aws_vpc.aws_vpc.default_security_group_id
}

output "vpc_instance_tenancy" {
  description = "The instance tenancy of the VPC"
  value       = aws_vpc.aws_vpc.instance_tenancy
}

output "vpc_ipv6_association_id" {
  description = "The association ID for the IPv6 CIDR block of the VPC"
  value       = aws_vpc.aws_vpc.ipv6_association_id
}

output "vpc_ipv6_cidr_block" {
  description = "The IPv6 CIDR block of the VPC"
  value       = aws_vpc.aws_vpc.ipv6_cidr_block
}

# Output for Subnet IDs
output "subnet_ids" {
  description = "The IDs of all subnets created by this configuration. The '*' operator is used to return a list of all subnet IDs."
  value       = aws_subnet.aws_subnet[*].id
}

# Output for Route Table IDs
output "route_table_ids" {
  description = "The IDs of all route tables created by this configuration. The '*' operator is used to return a list of all route table IDs."
  value       = aws_route_table.route_table[*].id
}

# Output for Route Table Association IDs
output "route_table_association_ids" {
  description = "The IDs of all route table associations created by this configuration. The '*' operator is used to return a list of all route table association IDs."
  value       = aws_route_table_association.subnet1_association[*].id
}

