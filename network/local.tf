locals {
  vpc_cidr            = var.network_cidrs.vpc[0]
  public_cidr_blocks  = var.network_cidrs.public_subnets
  private_cidr_blocks = var.network_cidrs.private_subnets
}

