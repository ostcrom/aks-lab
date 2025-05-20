
resource "azurerm_kubernetes_cluster" "k8s" {
  name                = format("%s-cluster", var.pet_name)
  resource_group_name = var.resource_group_name
  location            = var.location
  dns_prefix          = format("%s-cluster-dns", var.pet_name)
  tags                = var.azure_tags
  
  identity {
    type = "SystemAssigned"
  }

  default_node_pool {
    name           = "agentpool"
    vm_size        = "standard_b2s"
    node_count     = var.node_count
    vnet_subnet_id = var.subnet_id
  }
  
  node_resource_group = local.node_rg

  linux_profile {
    admin_username = var.username
    ssh_key {
      key_data = var.ssh_key_data
    }
  }
  
  network_profile {
    network_plugin = "kubenet"
    load_balancer_profile {
      managed_outbound_ip_count = 1
    }
  }
  
  storage_profile {
    blob_driver_enabled = true
  }
}
