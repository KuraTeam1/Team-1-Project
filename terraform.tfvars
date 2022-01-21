region = "us-east-1"

vpc_name = "kura1_vpc"

vpc_cidr = "192.168.0.0/16"

availability_zones = ["us-east-1a", "us-east-1b","us-east-1c"]

private_subnets = ["192.168.1.0/24", "192.168.2.0/24","192.168.3.0/24"]

public_subnets = ["192.168.101.0/24", "192.168.102.0/24","192.168.103.0/24"]

database_subnets = ["192.168.201.0/24", "192.168.202.0/24","192.168.203.0/24"]
resource "tls_private_key" "pk" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "kp" {
  key_name   = "kurakey"       # Create "myKey" to AWS!!
  public_key = tls_private_key.pk.public_key_openssh
}
ecs_key_pair_name= tls_private_key.pk.private_key_pem

ecs_ami = {
  us-east-1      = "ami-aff65ad2"
}
