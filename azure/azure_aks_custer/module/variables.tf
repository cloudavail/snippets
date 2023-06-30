variable "aks_resource_group_name" {
  type    = string
}
variable "aks_cluster_name" {
  type    = string
}

variable "aks_cluster_dns_prefix" {
  type    = string
}

variable "aks_cluster_node_count" {
  type    = number
}

variable "aks_cluster_node_vm_size" {
  type    = string
}

variable "identity_type" {
  type    = string
}

variable "environment" {
  type    = string
}

variable "aks_cluster_private_cluster_enabled" {
  type    = bool
}
