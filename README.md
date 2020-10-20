# Terraform for deploying Lacework as an ECS Service

## Description

This is a repository of Terraform code which deploys the Lacework Datacollector as a daemon service in an Elastic Container Service (ECS) cluster.

## ECS Task Definition

The `ecs_task_definition.tf` file will configure an ECS Task Definition which will then be used to run the Lacework Datacollector container.

## ECS Daemon Service

The `ecs_service.tf` file will configure a daemon Service within the specified ECS Cluster which will run the Task Definition above.

## Variables

| Name | Description | Type | Default |
|------|-------------|------|---------|
| ecs_cluster_name | The name of the ECS cluster to leverage when deploying the Service | `string` | null |
| ecs_service_name | The desired name of the ECS Service | `string` | "lacework-datacollector" |
| ecs_task_family | The desired name of the ECS Task Definition | `string` | "lacework-datacollector" |
| ecs_task_role | The name of the Role to use when executing the ECS task | `string` | "ecsTaskExecutionRole" |
| ecs_cpu_for_lacework | The amount of CPU units to assign to the task | `string` | "512" |
| ecs_mem_for_lacework | The amount of Memory (MiB) to assign to the task | `string` | "512" |
| lacework_access_token | The Lacework Access Token for the Datacollector to use | `string` | null |
