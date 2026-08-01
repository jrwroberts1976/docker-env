
output "environment" {

  value = var.environment

}


output "region" {

  value = var.aws_region

}


output "vpc_id" {

  value = module.networking.vpc_id

}


output "public_subnet_id" {

  value = module.networking.public_subnet_id

}


output "private_subnet_id" {

  value = module.networking.private_subnet_id

}
output "instance_id" {

  value = module.ec2.instance_id

}


output "instance_public_ip" {

  value = module.ec2.public_ip

}


output "instance_private_ip" {

  value = module.ec2.private_ip

}
