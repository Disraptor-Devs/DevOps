output "sg_arn" {
  description = "The name of the security group"
  value       = aws_security_group.security.arn
}

output "sg_name" {
    description = "The name of the security group"
    value       = aws_security_group.security.name
}

output "sg_id" {
    description = "The ID of the security group"
    value       = aws_security_group.security.id
}

output "sg_vpc_id" {
    description = "The VPC ID of the security group"
    value       = aws_security_group.security.vpc_id
}
