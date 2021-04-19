resource "azurerm_resource_group" "main" {
  name     = "sikademo-k8s"
  location = "West Europe"
}

module "sikademo" {
  source                 = "ondrejsika/azure-k8s/module"
  version                = "0.1.2"
  name                   = "sikademo"
  azurerm_resource_group = azurerm_resource_group.main
  node_count             = 3
}

output "kubeconfig" {
  value     = module.sikademo.kubeconfig
  sensitive = true
}
