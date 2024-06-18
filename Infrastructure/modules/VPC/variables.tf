variable "region" {
  description = "The AWS region where the infrastructure will be deployed. Default is 'af-south-1'."
  type        = string
  default     = "af-south-1"
}

variable "cidr_block" {
  description = "Your CIDR Block range"
  type        = string
  default     = "10.0.0.0/16"
}

variable "instance_tenancy" {
  description = "A tenancy option for instances launched into the VPC. Default is default."
  type        = string
  default     = "default"
}

variable "vpc_tags" {
  description = "Specifies the tags (key, value pairs) to be associated with the eventBridge rule"
  type        = map(string)
}

# Subnet

variable "subnets_cidr" {
  description = "This is the cidr block for the subnet in Level Finance VPC - Whitelisting"
  type        = list(string)
}

variable "map_public_ip_on_launch" {
  description = "Specify true to indicate that instances launched into the subnet should be assigned a public IP address. Default is true."
  type        = bool
  default     = true
}

variable "availability_zone" {
  description = "This is the availability zone in a region - Whitelisting"
  type        = list(string)
}

variable "subnet_count" {
  description = "This is the number of subnets to be provisioned"
  type        = number
}

variable "subnet_name" {
  description = "Name of the subnet"
  type        = list(string)
}

variable "subnet_tags" {
  description = "Specifies the tags (key, value pairs) to be associated with the eventBridge rule"
  type        = map(string)
}

variable "igw_tags" {
  description = "Specifies the tags (key, value pairs) to be associated with the Internet Gateway"
  type        = map(string)
}


# route table variable
variable "rt_name" {
  description = "The name of the route table"
  type        = string
}

variable "routes" {
  description = "Values for the CIDR Block and Gateway ID"
  type = list(object({
    cidr_block = string
    gateway_id = string
  }))
  default = []
}

variable "routes_tags" {
  description = "Specifies the tags (key, value pairs) to be associated with the eventBridge rule"
  type        = map(string)
}

variable "create_igw_attachment" {
  description = "Boolean flag to determine whether to create the Internet Gateway attachment"
  type        = bool
  default     = false
}
