output "ec2_arn" {
  description = "The ARN of the EC2 instance"
  value       = aws_instance.ec2_instance.arn
}

output "ec2_ami" {
  description = "The VPC ID of the EC2 instance"
  value       = aws_instance.ec2_instance.ami
}

output "ec2_instance_id" {
  description = "The ID of the EC2 instance"
  value       = aws_instance.ec2_instance.id
}