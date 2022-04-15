variable "region" {
  type        = string
  description = "Main region or zone to be used. The default will be a zonal cluster."
  default     = "us-east1-b"
}

variable "project_id" {
  type        = string
  description = "Project ID to be used."
}

variable "cluster_name" {
  type        = string
  description = "The cluster name to be deployed."
}

variable "node_pools" {
  type        = list(any)
  description = "Used to choose node pools settings."
  default     = [{
    node_name      = "default"
    node_count     = 1
    preemptible    = false
    machine_type   = "e2-small"
    min_node_count = 0
    max_node_count = 0
    label          = "default"
  }]
}
