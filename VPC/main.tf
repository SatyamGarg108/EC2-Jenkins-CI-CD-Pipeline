provider "aws" {
  region = "us-east-1"
}

module "VPC_creation" {
  source = "./module/vpc_module"
  vpc_cidr = "10.0.0.0/26"
}
