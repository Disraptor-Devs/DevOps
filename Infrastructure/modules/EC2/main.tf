data "aws_vpc" "existing_vpc" {
  count = var.is_existing_vpc ? 1 : 0
  id    = var.vpc_id
}

data "aws_subnets" "existing_subnets" {
  count = var.is_existing_vpc ? 1 : 0
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.existing_vpc[0].id]
  }
}

data "aws_ami" "found_ami" {
  most_recent = true
  owners      = var.ami_owners

  dynamic "filter" {
    for_each = {
      for key, value in var.ami_filters :
      key => value
    }

    content {
      name   = filter.key
      values = filter.value
    }
  }
}

data "aws_iam_policy_document" "assume_role" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
  }
}



data "aws_iam_policy_document" "inline_policy" {
  statement {
    actions = [
      "ec2:*",
      "s3:*",
      "cloudwatch:*",
      "logs:*",
      "ssm:*"
    ]
    resources = ["*"]
    
  }
}

resource "aws_iam_role" "ec2_role" {
  name               = var.ec2_role_name
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
  inline_policy {
    name   = "inline_policy_sftp_ec2"
    policy = data.aws_iam_policy_document.inline_policy.json
  
  }
}


resource "aws_instance" "ec2_instance" {
  ami                    = data.aws_ami.found_ami.id
  vpc_security_group_ids = var.security_group_ids
  instance_type          = var.instance_type
  key_name               = var.key_pair_name
  iam_instance_profile   = aws_iam_role.ec2_role.name
  root_block_device {
    encrypted   = true
    volume_size = var.ec2_root_volume_size
    volume_type = var.ec2_volume_type
  }
  ebs_optimized    = true
  user_data_base64 = var.user_data_base64

  monitoring = var.monitoring_enabled

  tags        = merge(var.ec2_tags)
  volume_tags = merge(var.ec2_tags)
}