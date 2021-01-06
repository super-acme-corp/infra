terraform {
  backend "remote" {
    organization = "YOUR-ORGANIZATION"

    workspaces {
      name = "YOUR-WORKSPACE"
    }
  }
}

module "network" {
   source  = "app.terraform.io/super-acme-corp/network/aws"
  version = "1.0.0" 

  aws_region   = var.aws_region
  dns_zone_name = var.domain
  network_name = var.app_name
}

module "app" {
  source  = "app.terraform.io/super-acme-corp/app/aws"
  version = "1.0.0"

  app_name   = var.app_name
  app_port   = var.app_port
  aws_region = var.aws_region

  container_registry          = var.registry
  container_registry_username = var.registry_username
  container_registry_password = var.registry_password
  container_image             = var.image
  container_tag               = var.tag

  app_subnets = module.network.vpc_private_subnets
  lb_subdomain = var.subdomain
  lb_subnets  = module.network.vpc_public_subnets
  dns_zone_id = module.network.dns_zone_id
  vpc_id      = module.network.vpc_id
}
