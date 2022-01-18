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
resource "aws_subnet" "app-subnet-1" {
  vpc_id                  = aws_vpc.team1-vpc.id
  cidr_block              = "10.0.11.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = false

  tags = {
    Name = "app-1a"
  }
}
resource "aws_subnet" "app-subnet-2" {
  vpc_id                  = aws_vpc.team1-vpc.id
  cidr_block              = "10.0.12.0/24"
  availability_zone       = "us-east-1b"
  map_public_ip_on_launch = false

  tags = {
    Name = "app-2b"
  }
}
resource "aws_subnet" "app-subnet-3" {
  vpc_id                  = aws_vpc.team1-vpc.id
  cidr_block              = "10.0.13.0/24"
  availability_zone       = "us-east-1c"
  map_public_ip_on_launch = false

  tags = {
    Name = "app-3c"
  }
}

# Create Database Private Subnets
resource "aws_subnet" "database-subnet-1" {
  vpc_id            = aws_vpc.team1-vpc.id
  cidr_block        = "10.0.21.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "DB-1a"
  }
}

resource "aws_subnet" "database-subnet-2" {
  vpc_id            = aws_vpc.team1-vpc.id
  cidr_block        = "10.0.22.0/24"
  availability_zone = "us-east-1b"

  tags = {
    Name = "DB-2b"
  }
}
resource "aws_subnet" "database-subnet-3" {
  vpc_id            = aws_vpc.team1-vpc.id
  cidr_block        = "10.0.23.0/24"
  availability_zone = "us-east-1c"

  tags = {
    Name = "DB-3c"
  }
}

# Create Internet Gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.team1-vpc.id

  tags = {
    Name = "igw"
  }
}

 resource "aws_nat_gateway" "natg1" {
   connectivity_type = "private"
   subnet_id         = aws_subnet.app-subnet-1.id

     tags = {
     Name = "App1 NAT"
   }
 }
  resource "aws_nat_gateway" "natg2" {
   connectivity_type = "private"
   subnet_id         = aws_subnet.app-subnet-2.id

     tags = {
     Name = "App2 NAT"
   }
 }

 resource "aws_nat_gateway" "natg3" {
   connectivity_type = "private"
   subnet_id         = aws_subnet.app-subnet-3.id

     tags = {
     Name = "App3 NAT"
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
    Name = "WebRT"
  }
}

# Create Web Subnet association with Web route table
resource "aws_route_table_association" "web-a" {
  subnet_id      = aws_subnet.web-subnet-1.id
  route_table_id = aws_route_table.web-rt.id
}

resource "aws_route_table_association" "web-b" {
  subnet_id      = aws_subnet.web-subnet-2.id
  route_table_id = aws_route_table.web-rt.id
}

resource "aws_route_table_association" "web-c" {
  subnet_id      = aws_subnet.web-subnet-3.id
  route_table_id = aws_route_table.web-rt.id
}

# Creates Application Route Table 
resource "aws_route_table" "app-rt" {
   vpc_id = aws_vpc.team1-vpc.id
   route = []
   tags = {
     "Name" = "AppRT"
   }
 }
resource "aws_route_table_association" "app-a" {
  subnet_id      = aws_subnet.app-subnet-1.id
  route_table_id = aws_route_table.app-rt.id
}

resource "aws_route_table_association" "app-b" {
  subnet_id      = aws_subnet.app-subnet-2.id
  route_table_id = aws_route_table.app-rt.id
}

resource "aws_route_table_association" "app-c" {
  subnet_id      = aws_subnet.app-subnet-3.id
  route_table_id = aws_route_table.app-rt.id
}


