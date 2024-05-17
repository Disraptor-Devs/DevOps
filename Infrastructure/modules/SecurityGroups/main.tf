resource "aws_security_group" "security" {
    name        = var.sg_name
    description = var.sg_description
    vpc_id      = var.vpc_id
    tags        = var.sg_tags 
}

resource "aws_security_group_rule" "ingress" {
    for_each    = var.ingress_rules
    type        = "ingress"
    description = each.value.description
    from_port   = each.value.from_port
    to_port     = each.value.to_port
    protocol    = each.value.protocol
    cidr_blocks = each.value.cidr_blocks
    security_group_id = aws_security_group.security.id
}

resource "aws_security_group_rule" "egress" {
    for_each    = var.egress_rules
    type        = "egress"
    from_port   = each.value.from_port
    to_port     = each.value.to_port
    protocol    = each.value.protocol
    cidr_blocks = each.value.cidr_blocks
    security_group_id = aws_security_group.security.id
}