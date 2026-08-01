resource "aws_key_pair" "main" {

  key_name = var.key_name

  public_key = file("~/.ssh/${var.key_name}.pub")

}


resource "aws_security_group" "ec2" {

  name = "cloud-platform-${var.environment}-ec2"

  description = "Security group for cloud platform EC2 instance"

  vpc_id = var.vpc_id


  ingress {

    description = "SSH access"

    from_port = 22

    to_port = 22

    protocol = "tcp"

    cidr_blocks = [
      "${var.admin_ip}/32"
    ]

  }


  ingress {

    description = "HTTP access through nginx"

    from_port = 80

    to_port = 80

    protocol = "tcp"

    cidr_blocks = [
      "0.0.0.0/0"
    ]

  }


  egress {

    from_port = 0

    to_port = 0

    protocol = "-1"

    cidr_blocks = [
      "0.0.0.0/0"
    ]

  }
 ingress {

  description = "HTTPS access"

  from_port = 443

  to_port = 443

  protocol = "tcp"

  cidr_blocks = [
    "0.0.0.0/0"
  ]

}

  tags = {

    Name = "cloud-platform-${var.environment}-ec2-sg"

    Environment = var.environment

  }

}


resource "aws_instance" "main" {

  ami = data.aws_ami.amazon_linux.id

  instance_type = var.instance_type

  subnet_id = var.subnet_id


  vpc_security_group_ids = [
    aws_security_group.ec2.id
  ]


  key_name = aws_key_pair.main.key_name


  associate_public_ip_address = true


  tags = {

    Name = "cloud-platform-${var.environment}-server"

    Environment = var.environment

    Project = "cloud-platform"

  }

}


data "aws_ami" "amazon_linux" {

  most_recent = true


  owners = [
    "amazon"
  ]


  filter {

    name = "name"

    values = [
      "al2023-ami-*-x86_64"
    ]

  }


  filter {

    name = "virtualization-type"

    values = [
      "hvm"
    ]

  }

}

