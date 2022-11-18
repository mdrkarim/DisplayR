
# Create VPC
resource "aws_vpc" "displayr" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "DisplayR"
  }
}
# Create Subnets
resource "aws_subnet" "displayr-subnet-1" {
   vpc_id     = aws_vpc.displayr.id
   cidr_block = "10.0.1.0/24"
   map_public_ip_on_launch = true
}
# Create Internet Gateway
resource "aws_internet_gateway" "displayr-igw" {
  vpc_id = aws_vpc.displayr.id
}

# Create Route Table

resource "aws_route_table" "displayr-RT" {
  vpc_id = aws_vpc.displayr.id
}

# Create Route
resource "aws_route" "displayr-route" {
    route_table_id = aws_route_table.displayr-RT.id
    destination_cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.displayr-igw.id
  
}

# Create Route Table Association
resource "aws_route_table_association" "displayr-RT-associate" {
    route_table_id = aws_route_table.displayr-RT.id
    subnet_id = aws_subnet.displayr-subnet-1.id
  
}


/*

resource "aws_default_vpc" "default_vpc" {
  tags = {
    Name = "Default VPC"
  }
}*/