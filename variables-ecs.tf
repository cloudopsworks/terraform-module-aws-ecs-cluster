##
# (c) 2021-2025
#     Cloud Ops Works LLC - https://cloudops.works/
#     Find us on:
#       GitHub: https://github.com/cloudopsworks
#       WebSite: https://cloudops.works
#     Distributed Under Apache v2.0 License
#

variable "settings" {
  description = "ECS Cluster Settings"
  type        = any
  default     = {}
}

variable "name" {
  description = "(optional) The name of the cluster. If you don't specify a name, name_prefix will be used."
  type        = string
  default     = ""
  nullable    = false
}

variable "name_prefix" {
  description = "(optional) Creates a unique name beginning with the specified prefix. Conflicts with name."
  type        = string
  default     = ""
  nullable    = false
}