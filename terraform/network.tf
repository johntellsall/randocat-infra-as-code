# network.tf

module "vpc" {
  source = "terraform-aws-modules/vpc/aws"
  version = "1.59.0"

  name = "mar16-vpc"
  cidr = "10.0.0.0/16"

  azs             = ["us-east-1a", "us-east-1b"]
  # for secure Lambdas (no internet routing)
  # - intra_subnets = ["10.0.1.0/24"]
  database_subnets= ["10.0.20.0/24", "10.0.21.0/24"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24"]

  enable_nat_gateway = true
  enable_vpn_gateway = true

  tags = {
    Terraform = "true"
    Environment = "mar16"
  }
}
