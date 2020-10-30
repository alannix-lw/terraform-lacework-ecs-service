variable "aws_region" {
  default = "us-east-1"
}
variable "aws_profile" {
  default = "default"
}
variable "ecs_cluster_name" {}
variable "ecs_service_name" {
  default = "lacework-datacollector"
}
variable "ecs_task_family" {
  default = "lacework-datacollector"
}
variable "ecs_task_role" {
  default = "ecsTaskExecutionRole"
}
variable "ecs_cpu_for_lacework" {
  default = "512"
}
variable "ecs_mem_for_lacework" {
  default = "512"
}
variable "lacework_access_token" {}
