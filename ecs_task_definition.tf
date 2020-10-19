provider "aws" {
  region = var.aws_region
}

locals {
  container_definition_json = jsonencode([
    {
      "environment" : [
        {
          "name" : "LaceworkAccessToken",
          "value" : var.lacework_access_token,
        },
      ],
      "essential" : true,
      "image" : "lacework/datacollector",
      "name" : var.ecs_task_family,
      "privileged" : true
    }
  ])
}

data "aws_iam_role" "ecs_task_role" {
  name = var.ecs_task_role
}

resource "aws_ecs_task_definition" "lacework_datacollector" {
  family                = var.ecs_task_family
  container_definitions = local.container_definition_json

  cpu    = var.ecs_cpu_for_lacework
  memory = var.ecs_mem_for_lacework

  task_role_arn      = data.aws_iam_role.ecs_task_role.arn
  execution_role_arn = data.aws_iam_role.ecs_task_role.arn
}
