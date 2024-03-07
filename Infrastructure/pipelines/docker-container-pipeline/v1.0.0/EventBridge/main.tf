# Create EventBridge bus
resource "aws_cloudwatch_event_bus" "eventbridge_bus" {
  name = "jenkins-bus"
}

# Create EventBridge rule
resource "aws_cloudwatch_event_rule" "eventbridge_rule" {
  name        = "jenkins-eventbridge-rule"
  description = "Trigger ECS Fargate task on S3 object create"

  event_pattern = <<PATTERN
{
  "source": ["aws.s3"],
  "detail-type": ["AWS API Call via CloudTrail"],
  "detail": {
    "eventSource": ["s3.amazonaws.com"],
    "eventName": ["PutObject"]
  }
}
PATTERN

  event_bus_name = aws_cloudwatch_event_bus.eventbridge_bus.name
}

# Create ECS Fargate task definition
resource "aws_ecs_task_definition" "fargate_task" {
  family                   = "my-fargate-task"
  execution_role_arn       = aws_iam_role.ecs_task_execution_role.arn
  task_role_arn            = aws_iam_role.ecs_task_role.arn
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]

  container_definitions = <<DEFINITION
[
  {
    "name": "my-container",
    "image": "my-container-image",
    "cpu": 256,
    "memory": 512,
    "portMappings": [
      {
        "containerPort": 80,
        "protocol": "tcp"
      }
    ],
    "environment": [
      {
        "name": "ENV_VAR_NAME",
        "value": "ENV_VAR_VALUE"
      }
    ]
  }
]
DEFINITION
}

# Create IAM role for ECS task execution
resource "aws_iam_role" "ecs_task_execution_role" {
  name = "my-ecs-task-execution-role"

  assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "ecs-tasks.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
POLICY
}

# Create IAM role for ECS task
resource "aws_iam_role" "ecs_task_role" {
  name = "my-ecs-task-role"

  assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "ecs-tasks.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
POLICY
}
