provider "aws" {
  region = "us-east-1"
}

module "my_vpc" {
  source      = "../modules/networking"
  vpc_cidr    = "192.168.0.0/16"
  tenancy     = "default"
  vpc_id      = module.my_app.vpc_id
  subnet_cidr = "192.168.1.0/24"
}

module "my_ec2" {
  source        = "../modules/ec2"
  web_ec2_count = 1
  #ami_id        = "ami-5a8da735"
  instance_type = "t2.micro"
  subnet_id     = module.my_vpc.subnet_id
}
