resource "aws_ecs_task_definition" "jenkins_task" {
  family                   = "jenkins-task"
  execution_role_arn       = aws_iam_role.ecs_task_execution_role.arn
  task_role_arn            = aws_iam_role.ecs_task_role.arn
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]

  container_definitions = jsonencode(
    [
      {
        "name" : "jenkins-container",
        "image" : "jenkins/jenkins:lts",
        "cpu" : 256,
        "memory" : 512,
        "portMappings" : [
          {
            "containerPort" : 6537,
            "hostPort" : 6537,
            "protocol" : "tcp"
          }
        ],
        "environment" : [
          {
            "name" : "ENV_VAR_NAME",
            "value" : "ENV_VAR_VALUE"
          }
        ]
      }
  ])

  volume {
    name = "jenkins-volume"
    efs_volume_configuration {
      file_system_id     = aws_efs_file_system.jenkins_fs.id
      root_directory     = "/jenkins"
      transit_encryption = "ENABLED"
    }
  }

  runtime_platform {
    operating_system_family = "LINUX"
    cpu_architecture        = "X86_64"
  }


}