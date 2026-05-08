terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "~>6.40"
    }
  }
}

#Configure the AWS Provider 
provider "aws" {
  region = "ap-south-1"
}

#Create security group for ec2 instance 
resource "aws_security_group" "ec2_security_group" {
  name = "ec2 security group"

  description = "Allow access on port 22"

  #allow access on port 22
  ingress {
    description = "ssh access"
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = -1
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Monitoring server security group"
  }
}

resource "aws_instance" "Monitoring_server" {
  ami = "ami-07a00cf47dbbc844c"
  instance_type = "t3.small"
  security_groups = [aws_security_group.ec2_security_group.name]
  key_name = var.key_name

  tags = {
    Name = var.instance_name
  }
}