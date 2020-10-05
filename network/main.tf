module "hive-mgmt-vpc" {
  source                = "terraform-aws-modules/vpc/aws"
  name                  = "dp-sandbox-eks-vpc"
  cidr                  = local.vpc_cidr
  single_nat_gateway    = true

  azs                   = data.aws_availability_zones.available.names
  public_subnets        = local.public_cidr_blocks
  private_subnets        = local.private_cidr_blocks
  enable_dns_support    = true
  enable_dns_hostnames  = true

  tags = {
      "kubernetes.io/cluster/ddp-sandbox-eks-vpcs" = "shared"
  }
}