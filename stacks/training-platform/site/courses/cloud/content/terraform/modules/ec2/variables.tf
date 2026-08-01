variable "vpc_id" {

  description = "VPC ID"

  type = string

}


variable "subnet_id" {

  description = "Subnet ID"

  type = string

}


variable "environment" {

  description = "Environment name"

  type = string

}


variable "key_name" {

  description = "SSH key pair name"

  type = string

}


variable "instance_type" {

  description = "EC2 instance type"

  type = string

  default = "t3.micro"

}


variable "admin_ip" {

  description = "Administrator public IP address allowed to SSH"

  type = string

}

variable "allocate_elastic_ip" {
  description = "Allocate and associate an Elastic IP with the EC2 instance."
  type        = bool
  default     = false
}
