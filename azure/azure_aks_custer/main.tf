module "aks_kubernetes_cluster" {
  source = "./module"
  environment = "test"
  aks_resource_group_name = "joesResourceGroup"
  aks_cluster_name = "cloudavail-kubernetes-cluster"
  aks_cluster_dns_prefix = "cloudavailtest"
  aks_cluster_private_cluster_enabled = true
  aks_cluster_node_count = 2
  aks_cluster_node_vm_size = "Standard_D2_v2"
  identity_type = "SystemAssigned"
}