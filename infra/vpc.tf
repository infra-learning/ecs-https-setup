module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.0.0"

  name           = "hands-on"
  cidr           = var.vpc_cidr
  azs            = var.azs
  public_subnets = var.public_subnets

  enable_nat_gateway      = false
  map_public_ip_on_launch = true
  enable_dns_support      = true
  enable_dns_hostnames    = true
}