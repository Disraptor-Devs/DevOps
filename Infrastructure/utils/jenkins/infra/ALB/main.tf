data "aws_vpc" "vpc" {
  id = "vpc-0da5531cdf58244fe"
}

data "aws_subnets" "disraptor_subnets" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.vpc.id]
  }
}

resource "aws_security_group" "alb_security_group" {
  name        = "jenkins-alb-security-group"
  description = "Security group for ALB"
  vpc_id      = data.aws_vpc.vpc.id

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

resource "aws_lb" "app_lb" {
  name            = "disraptor-jenkins-alb"
  internal        = true # Set to true if you want an internal ALB
  security_groups = [aws_security_group.alb_security_group.id]

  subnets = data.aws_subnets.disraptor_subnets.ids

  tags = merge(
    { Name = "disraptor-jenkins-alb" },
    { "project-name" = "disraptor-jenkins"
      "owner"        = "shibule"
      "application"  = "jenkins"
  "environment" = "prod" })
}

resource "aws_lb_target_group" "app_lb_target_group" {
  name        = "disraptor-jenkins-alb-tg"
  target_type = "ip"
  port        = 8080
  protocol    = "HTTP"
  vpc_id      = data.aws_vpc.vpc.id

  health_check {
    enabled             = true
    interval            = 180
    timeout             = 120
    unhealthy_threshold = 2
    path                = "/"
    matcher             = "200"

  }

  tags = merge(
    { Name = "disraptor-jenkins-alb-tg" },
    { "project-name" = "disraptor-jenkins"
      "owner"        = "shibule"
      "application"  = "jenkins"
  "environment" = "prod" })
}

data "aws_ecs_cluster" "ecs_cluster" {
  cluster_name = "disraptor-jenkins"
}

data "aws_ecs_service" "ecs_service" {
  service_name = "disraptor-jenkins-service"
  cluster_arn  = data.aws_ecs_cluster.ecs_cluster.arn
}


resource "aws_lb_listener" "app_lb_listener" {
  load_balancer_arn = aws_lb.app_lb.arn
  port              = 80 # Update this to match your desired ALB port
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.app_lb_target_group.arn
  }

  tags = merge(
    { Name = "disraptor-jenkins-alb-listener" },
    { "project-name" = "disraptor-jenkins"
      "owner"        = "shibule"
      "application"  = "jenkins"
  "environment" = "prod" })
}
