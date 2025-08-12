##
# (c) 2021-2025
#     Cloud Ops Works LLC - https://cloudops.works/
#     Find us on:
#       GitHub: https://github.com/cloudopsworks
#       WebSite: https://cloudops.works
#     Distributed Under Apache v2.0 License
#

locals {
  cluster_name = var.name != "" ? var.name : format("%s-%s", var.name_prefix, local.system_name)
}

module "ecs_cluster" {
  source                                 = "terraform-aws-modules/ecs/aws"
  version                                = "~> 6.2"
  cluster_name                           = local.cluster_name
  cluster_configuration                  = try(var.settings.cluster_configuration, null)
  default_capacity_provider_strategy     = try(var.settings.default_capacity_provider_strategy, null)
  autoscaling_capacity_providers         = try(var.settings.autoscaling_capacity_providers, null)
  services                               = try(var.settings.services, null)
  create_cloudwatch_log_group            = try(var.settings.create_cloudwatch_log_group, true)
  cloudwatch_log_group_class             = try(var.settings.cloudwatch.log_group_class, null)
  cloudwatch_log_group_kms_key_id        = try(var.settings.cloudwatch.log_group_kms_key_id, null)
  cloudwatch_log_group_name              = try(var.settings.cloudwatch.log_group_name, null)
  cloudwatch_log_group_retention_in_days = try(var.settings.cloudwatch.log_group_retention_in_days, 90)
  cloudwatch_log_group_tags              = try(var.settings.cloudwatch.log_group_tags, null)
  cluster_service_connect_defaults       = try(var.settings.cluster_service_connect_defaults, null)
  cluster_setting                        = try(var.settings.cluster_setting, null)
  create_task_exec_iam_role              = try(var.settings.iam.create, true)
  task_exec_iam_role_name                = format("%s-task-exec-role", local.cluster_name)
  task_exec_iam_role_description         = try(var.settings.iam.role_description, "ECS Task Execution IAM Role")
  create_task_exec_policy                = try(var.settings.iam.create_task_policy, false)
  task_exec_iam_role_policies            = try(var.settings.iam.role_policies, [])
  task_exec_iam_role_use_name_prefix     = false
  task_exec_iam_statements               = try(var.settings.iam.role_statements, null)
  task_exec_secret_arns                  = try(var.settings.iam.task_exec_secret_arns, [])
  task_exec_ssm_param_arns               = try(var.settings.iam.task_exec_ssm_param_arns, [])
  tags                                   = local.all_tags
}