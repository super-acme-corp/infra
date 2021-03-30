module "network" {
  source  = "terraform.cloudsmith.io/infrastructure/network/aws"
  version = "1.0.5" 

  aws_region    = var.aws_region
  network_name  = var.app_name
}

module "app" {
  source  = "terraform.cloudsmith.io/infrastructure/app/aws"
  version = "1.0.4"

  app_name   = var.app_name
  app_port   = var.app_port
  aws_region = var.aws_region

  container_registry          = var.registry
  container_registry_username = var.registry_username
  container_registry_password = var.registry_password
  container_image             = var.image
  container_tag               = var.tag

  lb_arn       = module.network.lb_target_group_arn
  lb_subnets   = module.network.vpc_public_subnets
  vpc_id       = module.network.vpc_id
}
