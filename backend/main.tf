module "dp-eks-backend" {
  source = "../modules/backend/"
  state_name = "dp-eks-sandbox"
  aws_region = "eu-west-1"
  #allowed_account_ids = ["874966447508"]
  tags = {
    "Environment" = "sandbox"
    "Product" = "eks"
  }
}