variable "region" {
  description = "Specfies the region in which this resouce will be created in"
  type        = string
  default     = "af-south-1"
}

variable "vpc_id" {
  description = "Specifies the VPC ID in which the security group will be created"
  type        = string
}


variable "is_existing_vpc" {
  description = "Specifies whether the VPC is existing or not"
  type        = bool
  default     = false
  
}

variable "ami_owners" {
  description = "Specifies the owners of the AMI"
  type        = list(string)
  default     = ["AWS"]
}

variable "ami_filters" {
  description = "Specifies the filters to be applied to the AMI search"
  type        = map(string)
  default     = {}
}

variable "ec2_tags" {
  description = "Specify the tags (key, value pairs) to be associated with the EC2 instance"
  type        = map(string)
}

variable "ec2_instance_name" {
  description = "Specifies the name of the EC2 instance"
  type        = string
}

variable "ec2_root_volume_size" {
    description = "Specifies the size of the root volume of the EC2 instance"
    type        = number
    default     = 8
}

variable "instance_type" {
  description = "Specifies the type of the EC2 instance"
  type        = string
  default     = "t3.nano"
}

variable "user_data_base64" {
    description = "Specifies the user data to be executed on the EC2 instance"
    type        = string
}

variable "ec2_role_name" {
  description = "Specifies the name of the IAM role to be attached to the EC2 instance"
  type        = string
}

variable "key_pair_name" {
  description = "Specifies the name of the key pair to be attached to the EC2 instance"
  type        = string
}

variable "security_group_ids" {
  description = "Specifies the security group IDs to be attached to the EC2 instance"
  type        = set(string)
}

variable "ec2_volume_type" {
  description = "Specifies the type of the volume to be attached to the EC2 instance"
  type        = string
  default     = "gp2"
  
}