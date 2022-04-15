variable "repository" {
  type        = string
  description = "The repository name to be added."
}

variable "chart_name" {
  type        = string
  description = "The chart name to be deployed."
}

variable "release_name" {
  type        = string
  description = "The name of the releasing Chart."
}

variable "values_files" {
  type        = list(string)
  description = "The path to the values files."
}

variable "create_namespace" {
  type        = bool
  description = "Enable creation of a namespace."
  default     = false
}

variable "wait" {
  type        = bool
  description = "Will wait until all resources are in a ready state before marking the release as successful."
  default     = false
}

variable "atomic" {
  type        = bool
  description = "The wait flag will purges chart on fail."
  default     = false
}

variable "cleanup_on_fail" {
  type        = bool
  description = "Allow deletion of new resources created in this upgrade when upgrade fails."
  default     = false
}
