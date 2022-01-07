# Create a VPC
resource "aws_vpc" "team1-vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "team1-vpc"
  }
}

# Create Web Public Subnets
resource "aws_subnet" "web-subnet-1" {
  vpc_id                  = aws_vpc.team1-vpc.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "Web-1a"
  }
}

resource "aws_subnet" "web-subnet-2" {
  vpc_id                  = aws_vpc.team1-vpc.id
  cidr_block              = "10.0.2.0/24"
  availability_zone       = "us-east-1b"
  map_public_ip_on_launch = true

  tags = {
    Name = "Web-2b"
  }
}
resource "aws_subnet" "web-subnet-3" {
  vpc_id                  = aws_vpc.team1-vpc.id
  cidr_block              = "10.0.3.0/24"
  availability_zone       = "us-east-1c"
  map_public_ip_on_launch = true

  tags = {
    Name = "Web-3c"
  }
}

# Create Application Private Subnets
resource "aws_subnet" "application-subnet-1" {
  vpc_id                  = aws_vpc.team1-vpc.id
  cidr_block              = "10.0.11.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = false

  tags = {
    Name = "Application-1a"
  }
}

resource "aws_subnet" "application-subnet-2" {
  vpc_id                  = aws_vpc.team1-vpc.id
  cidr_block              = "10.0.12.0/24"
  availability_zone       = "us-east-1b"
  map_public_ip_on_launch = false

  tags = {
    Name = "Application-2b"
  }
}

resource "aws_subnet" "application-subnet-3" {
  vpc_id                  = aws_vpc.team1-vpc.id
  cidr_block              = "10.0.13.0/24"
  availability_zone       = "us-east-1c"
  map_public_ip_on_launch = false

  tags = {
    Name = "Application-3c"
  }
}

# Create Database Private Subnets
resource "aws_subnet" "database-subnet-1" {
  vpc_id            = aws_vpc.team1-vpc.id
  cidr_block        = "10.0.21.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "Database-1a"
  }
}

resource "aws_subnet" "database-subnet-2" {
  vpc_id            = aws_vpc.team1-vpc.id
  cidr_block        = "10.0.22.0/24"
  availability_zone = "us-east-1b"

  tags = {
    Name = "Database-2b"
  }
}
resource "aws_subnet" "database-subnet-3" {
  vpc_id            = aws_vpc.team1-vpc.id
  cidr_block        = "10.0.23.0/24"
  availability_zone = "us-east-1c"

  tags = {
    Name = "Database-3c"
  }
}

# Create Internet Gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.team1-vpc.id

  tags = {
    Name = "k1igw"
  }
}

# Create Web layer route table
resource "aws_route_table" "web-rt" {
  vpc_id = aws_vpc.team1-vpc.id


  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "k1WebRT"
  }
}

# Create Web Subnet association with Web route table
resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.web-subnet-1.id
  route_table_id = aws_route_table.web-rt.id
}

resource "aws_route_table_association" "b" {
  subnet_id      = aws_subnet.web-subnet-2.id
  route_table_id = aws_route_table.web-rt.id
}

resource "aws_route_table_association" "c" {
  subnet_id      = aws_subnet.web-subnet-3.id
  route_table_id = aws_route_table.web-rt.id
}