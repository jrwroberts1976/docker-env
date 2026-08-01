variable "aws_region" {

  description = "AWS region"

  type = string

  default = "eu-west-2"

}


variable "environment" {

  description = "Environment name"

  type = string

  default = "dev"

}


variable "admin_ip" {

  description = "Administrator public IP address"

  type = string

  default = "90.249.215.255"

}
