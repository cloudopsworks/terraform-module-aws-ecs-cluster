##
# (c) 2021-2025
#     Cloud Ops Works LLC - https://cloudops.works/
#     Find us on:
#       GitHub: https://github.com/cloudopsworks
#       WebSite: https://cloudops.works
#     Distributed Under Apache v2.0 License
#

output "ecs_cluster_name" {
  value = local.cluster_name
}

output "ecs_cluster_id" {
  value = module.ecs_cluster.cluster_id
}

output "ecs_cluster_arn" {
  value = module.ecs_cluster.cluster_arn
}

output "ecs_cluster_task_exec_iam_role_name" {
  value = module.ecs_cluster.task_exec_iam_role_name
}

output "ecs_cluster_task_exec_iam_role_arn" {
  value = module.ecs_cluster.task_exec_iam_role_arn
}

output "ecs_cluster_cloudwatch_log_group_arn" {
  value = module.ecs_cluster.cloudwatch_log_group_arn
}

output "ecs_cluster_cloudwatch_log_group_name" {
  value = module.ecs_cluster.cloudwatch_log_group_name
}