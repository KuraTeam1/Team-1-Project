terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 0.14.9"
}

provider "aws" {
  profile = "default"
  region  = "us-east-1"
}

resource "aws_instance" "ec2" {
  ami             = "ami-08dfbc89f2b92f657"
  instance_type   = "t2.micro"
  key_name        = "kurakey"
  user_data	= file("file.sh")
#  security_groups = [ "Docker" ]

  tags = {
    Name = "app-server"
  }
}

resource "aws_security_group" "Docker" {
  tags = {
    type = "terraform-test-security-group"
  }
}