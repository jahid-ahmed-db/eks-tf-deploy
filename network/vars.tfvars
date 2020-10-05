# ---------------- iam settings --------------------------
region = "eu-west-1"

network_cidrs = {
  vpc             = [
    "10.82.128.0/17"
  ]
  private_subnets = [
    "10.82.131.0/24",
    "10.82.132.0/24",
    "10.82.133.0/24"
  ]
  public_subnets  = [
    "10.82.141.0/24",
    "10.82.142.0/24",
    "10.82.143.0/24"
  ]
}

# ---------------- iam backend settings --------------------------
#region = "eu-west-1"

bucket = "dp-eks-sandbox-terraform-state"

key = "../backend/terraform.tfstate"

dynamodb_table = "dp-eks-sandbox-terraform-dynamodb"
