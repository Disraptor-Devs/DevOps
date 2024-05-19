variable "ingress_rules" {
  description = "Specifies the ingress rules for the security group"
  type = map(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
    description = string
  }))
  default = null
}

variable "egress_rules" {
  description = "Specifies the egress rules for the security group"
  type = map(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
    description = string
  }))
  default = null
}

variable "sg_name" {
  description = "Specifies the name of the security group"
  type        = string
}

variable "sg_description" {
  description = "Specifies the description of the security group"
  type        = string
}

variable "vpc_id" {
  description = "Specifies the VPC ID in which the security group will be created"
  type        = string
}

variable "sg_tags" {
  description = "Specifies the tags (key, value pairs) to be associated with the security group"
  type        = map(string)

}