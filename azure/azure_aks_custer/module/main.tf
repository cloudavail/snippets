data "azurerm_resource_group" "aks_resource_group" {
  name     = "${var.aks_resource_group_name}"
}

resource "azurerm_kubernetes_cluster" "aks_kubernetes_cluster" {
  name                    = "${var.aks_cluster_name}-${var.environment}"
  location                = data.azurerm_resource_group.aks_resource_group.location
  resource_group_name     = data.azurerm_resource_group.aks_resource_group.name
  dns_prefix              = "${var.aks_cluster_dns_prefix}"
  private_cluster_enabled = var.aks_cluster_private_cluster_enabled

  default_node_pool {
    name       = "default"
    node_count = var.aks_cluster_node_count
    vm_size    = "${var.aks_cluster_node_vm_size}"
  }

  identity {
    type = "${var.identity_type}"
  }

  tags = {
    key   = "Environment"
    value = "${var.environment}"
  }
}