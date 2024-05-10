resource "aws_efs_backup_policy" "jenkins_fs_backup_policy" {
  file_system_id = aws_efs_file_system.jenkins_fs.id
  backup_policy {
    status = "ENABLED"
    # lifecycle = "AFTER_7_DAYS"
  }

}

resource "aws_security_group" "efs_security_group" {
  name        = "jenkins-ecs-efs-security-group"
  description = "Security group for EFS"
  vpc_id      = "vpc-0da5531cdf58244fe"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 2049
    to_port     = 2049
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 2999
    to_port     = 2999
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


resource "aws_efs_file_system" "jenkins_fs" {
  creation_token   = "jenkins-efs"
  performance_mode = "generalPurpose"

  tags = {
    Name           = "jenkins-fs",
    "project-name" = "disraptor-jenkins"
    "owner"        = "shibule"
    "application"  = "jenkins"
    "environment"  = "prod"
  }
}

resource "aws_efs_mount_target" "efs_mount_1" {
  file_system_id  = aws_efs_file_system.jenkins_fs.id
  subnet_id       = "subnet-03f9767799e6d1fe0"
  security_groups = [aws_security_group.efs_security_group.id]
}

resource "aws_efs_mount_target" "efs_mount_2" {
  file_system_id  = aws_efs_file_system.jenkins_fs.id
  subnet_id       = "subnet-09fbebaa4abeaad62"
  security_groups = [aws_security_group.efs_security_group.id]
}

resource "aws_efs_mount_target" "efs_mount_3" {
  file_system_id  = aws_efs_file_system.jenkins_fs.id
  subnet_id       = "subnet-00ff744c7b4483a73"
  security_groups = [aws_security_group.efs_security_group.id]
}

resource "aws_efs_access_point" "efs_access_point" {
  file_system_id = aws_efs_file_system.jenkins_fs.id
  tags = {
    Name           = "jenkins-efs-ap",
    "project-name" = "disraptor-jenkins"
    "owner"        = "shibule"
    "application"  = "jenkins"
    "environment"  = "prod"
  }
  
}


data "aws_iam_policy_document" "policy" {
    statement {
    sid    = "efs_policy_document"
    effect = "Allow"

    principals {
      type        = "AWS"
      identifiers = ["*"]
    }

    actions = [
      "elasticfilesystem:*",
      "efs:*",
      "ecr:*",
      "ec2:*",
      "cloudwatch:*",
      "logs:*",
      "ssm:*",
      "secretsmanager:*",
      "kms:*",
      "dynamodb:*",
      "s3:*"
    ]

    resources = [aws_efs_file_system.jenkins_fs.arn]

  }
}

resource "aws_efs_file_system_policy" "policy" {
  file_system_id = aws_efs_file_system.jenkins_fs.id
  policy         = data.aws_iam_policy_document.policy.json
}

resource "aws_cloudwatch_log_group" "ecs_cluster_logs" {
  name              = "/ecs/disraptor-jenkins"
  retention_in_days = 7

  tags = merge(
    { Name = "disraptor-jenkins-cw-log-group" },
    {"project-name" = "disraptor-jenkins"
    "owner"        = "shibule"
    "application"  = "jenkins"
    "environment"  = "prod"})
}

resource "aws_ecs_cluster" "ecs_cluster" {
  name = "disraptor-jenkins"

  configuration {
    execute_command_configuration {
      logging = "OVERRIDE"

      log_configuration {
        cloud_watch_log_group_name  = aws_cloudwatch_log_group.ecs_cluster_logs.name
      }
    }
  }



  setting {
    name  = "containerInsights"
    value = "enabled"
  }

  tags = {
    Name           = "disraptor-jenkins-ecs-cluster",
    "project-name" = "disraptor-jenkins"
    "owner"        = "shibule"
    "application"  = "jenkins"
    "environment"  = "prod"
  }
}

resource "aws_ecs_task_definition" "ecs_task" {
  family                   = "ecs-jenkins-task"
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  cpu                      = "2048"
  memory                   = "4096" 
  container_definitions    = file("container-definition.json")

  volume {
    name = "Jenkins"

    efs_volume_configuration {
      file_system_id = aws_efs_file_system.jenkins_fs.id
      transit_encryption = "ENABLED"
      transit_encryption_port = 2999
      authorization_config {
        access_point_id = aws_efs_access_point.efs_access_point.id
        iam = "ENABLED"
      }
    }
    

  }


  runtime_platform {
    operating_system_family = "LINUX"
    cpu_architecture = "ARM64"
  }

  task_role_arn      = aws_iam_role.ecs_task_role.arn
  execution_role_arn = aws_iam_role.ecs_task_role.arn

  tags = merge(
    { Name = "disraptor-jenkins-ecs-task" },
    {"project-name" = "disraptor-jenkins"
    "owner"        = "shibule"
    "application"  = "jenkins"
    "environment"  = "prod"})
}


data "aws_iam_policy_document" "ecs_assume_role_policy" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["ecs-tasks.amazonaws.com"]
    }
  }

}

data "aws_iam_policy_document" "ecs_task_role_policy" {
  statement {
    actions = [
      "s3:*",
      "ecr:*",
      "logs:*",
      "cloudwatch:*",
      "ssm:*",
      "secretsmanager:*",
      "kms:*",
      "dynamodb:*",
      "elasticfilesystem:*",
      "ecs:*",
      "events:*",
      "efs:*",
      "ec2:*"
    ]

    resources = ["*"]

  }
}


resource "aws_iam_role" "ecs_task_role" {
  name               = "disraptor-jenkins-ecs-task-role"
  assume_role_policy = data.aws_iam_policy_document.ecs_assume_role_policy.json

  inline_policy {
    name   = "ecs-task-role-policy"
    policy = data.aws_iam_policy_document.ecs_task_role_policy.json
  }

  tags = merge(
    { Name = "disraptor-jenkins-iam-role" },
    {"project-name" = "disraptor-jenkins"
    "owner"        = "shibule"
    "application"  = "jenkins"
    "environment"  = "prod"})

}

resource "aws_ecs_service" "ecs_service" {
    name             = "disraptor-jenkins-service"
    cluster          = aws_ecs_cluster.ecs_cluster.arn
    task_definition  = aws_ecs_task_definition.ecs_task.arn
    desired_count    = 1
    launch_type      = "FARGATE"
    platform_version = "LATEST"
    
    network_configuration {
        subnets          = ["subnet-00ff744c7b4483a73", "subnet-09fbebaa4abeaad62", "subnet-03f9767799e6d1fe0"]
        security_groups  = [aws_security_group.efs_security_group.id]
        assign_public_ip = true
    }

    
    
    tags = merge(
    { Name = "disraptor-jenkins-ecs-service" },
    {"project-name" = "disraptor-jenkins"
    "owner"        = "shibule"
    "application"  = "jenkins"
    "environment"  = "prod"})
  
}
