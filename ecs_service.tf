data "aws_ecs_cluster" "ecs_cluster" {
  cluster_name = var.ecs_cluster_name
}

resource "aws_ecs_service" "lacework_datacollector" {
  name                = var.ecs_service_name
  cluster             = data.aws_ecs_cluster.ecs_cluster.arn
  scheduling_strategy = "DAEMON"
  task_definition     = aws_ecs_task_definition.lacework_datacollector.arn
}
