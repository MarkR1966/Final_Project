provider "aws" {
  region                  = var.region
  shared_credentials_file = "~/.aws/credentials"
}

module "FP_VPC" {
  source = "./VPC"
}

module "sg_manager_myip" {
  sg_web_name   = "Manager SG For My IP"
  source        = "./SG"
  ip_addresses  = "0.0.0.0/0"
  ingress_ports = [22, 8080, 8079]
  vpc_id        = module.FP_VPC.vpc_id
}

module "sg_manager_open" {
  sg_web_name   = "Manager SG Open"
  source        = "./SG"
  ingress_ports = [80]
  vpc_id        = module.FP_VPC.vpc_id
}

module "sg_worker_myip" {
  sg_web_name  = "Worker SG For My IP"
  source       = "./SG"
  ip_addresses = "34.244.167.32/32"
  vpc_id       = module.FP_VPC.vpc_id
}

# data "template_file" "init" {
#   template = "${file("${path.module}/scripts/setup.sh")}"
# }

module "manager_node" {
  source                 = "./EC2"
  name                   = "Manager"
  subnet_id              = module.FP_VPC.subnet_a_id
  vpc_security_group_ids = [module.sg_manager_myip.sg_id, module.sg_manager_open.sg_id]
  # user_data              = data.template_file.init.rendered
}

module "eks" {
  source     = "./EKS"
  subnet_ids = [module.FP_VPC.subnet_a_id, module.FP_VPC.subnet_b_id]
}

module "cloudwatch" {
  source = "./CW"
}
