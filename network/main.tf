module "hive-mgmt-vpc" {
  source                = "terraform-aws-modules/vpc/aws"
  name                  = "dp-sandbox-eks-vpc"
  cidr                  = local.vpc_cidr
  single_nat_gateway    = true

  #azs                   = data.aws_availability_zones.available.names
  #public_subnets        = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]
  enable_dns_support    = true
  enable_dns_hostnames  = true

  tags = {
      "kubernetes.io/cluster/ddp-sandbox-eks-vpcs" = "shared"
  }

  subnets = [
      {
          name = "hive-dp-eks-private"
          availability_zone = {
              data.aws_availability_zones.available.names[0] = local.private_cidr_blocks[0]
              data.aws_availability_zones.available.names[0] = local.private_cidr_blocks[1]
              data.aws_availability_zones.available.names[0] = local.private_cidr_blocks[2]
          }
      },
      {
          name = "hive-dp-eks-public"
          availability_zone = {
              data.aws_availability_zones.available.names[0] = local.public_cidr_blocks[0]
              data.aws_availability_zones.available.names[0] = local.public_cidr_blocks[1]
              data.aws_availability_zones.available.names[0] = local.public_cidr_blocks[2]
            }
      }       
              
    ]
}