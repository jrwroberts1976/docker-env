variable "vpc_cidr" {

  description = "CIDR range for VPC"

  type = string

}


variable "public_subnet_cidr" {

  description = "Public subnet CIDR"

  type = string

}


variable "private_subnet_cidr" {

  description = "Private subnet CIDR"

  type = string

}


variable "availability_zone" {

  description = "AWS availability zone"

  type = string

}


variable "environment" {

  description = "Environment name"

  type = string

}
