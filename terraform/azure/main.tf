module "core" {
  source = "./modules/core"
  location = var.location
  azure_tags = local.tags
}

module "ssh" {
  source = "./modules/ssh"
  location = var.location
  resource_group_id = module.core.resource_group_id
  pet_name = module.core.pet_name
  providers = {
    azapi = azapi
  }
  depends_on = [module.core]
}

module "network" {
  source = "./modules/network"
  location = var.location
  resource_group_name = module.core.resource_group_name
  pet_name = module.core.pet_name
  azure_tags = local.tags
  depends_on = [module.core]
}

module "aks" {
  source = "./modules/aks"
  location = var.location
  azure_tags = local.tags
  resource_group_name = module.core.resource_group_name
  pet_name = module.core.pet_name
  subnet_id = module.network.subnet_id
  ssh_key_data = module.ssh.key_data
  depends_on = [module.network, module.ssh]
}

module "dns" {
  count  = var.phase2 ? 1 : 0
  source = "./modules/dns"
  location = var.location
  resource_group_name = module.core.resource_group_name
  azure_tags = local.tags
  custom_domain = var.custom_domain
  ingress_ip = var.ingress_ip
  depends_on = [module.aks]
}
