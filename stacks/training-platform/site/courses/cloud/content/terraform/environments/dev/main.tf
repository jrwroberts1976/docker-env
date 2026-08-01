module "networking" {

  source = "../../modules/networking"


  vpc_cidr = "10.0.0.0/16"

  environment = var.environment

  public_subnet_cidr = "10.0.1.0/24"

  private_subnet_cidr = "10.0.2.0/24"

  availability_zone = "eu-west-2a"

}


module "ec2" {

  source = "../../modules/ec2"


  vpc_id = module.networking.vpc_id

  subnet_id = module.networking.public_subnet_id


  environment = var.environment

  key_name = "cloud-platform-ec2"


  admin_ip = var.admin_ip

  allocate_elastic_ip = true
}
