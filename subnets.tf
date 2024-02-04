#Creating Subnets for Demo VPC
#Creating 1st public subnet for web
resource "aws_subnet" "web-subnet-1" {
  vpc_id                  = aws_vpc.demovpc.id
  cidr_block              = var.subnet1_cidr
  map_public_ip_on_launch = "true"
  availability_zone       = "us-east-2a"
  tags = {
    Name = "Web Subnet 1"
  }
}

#Creating 2nd Public Subnet for web
resource "aws_subnet" "web-subnet-2" {
  vpc_id                  = aws_vpc.demovpc.id
  cidr_block              = var.subnet2_cidr
  map_public_ip_on_launch = "true"
  availability_zone       = "us-east-2b"
  tags = {
    Name = "Web Subnet 2"
  }
}

#Creating 3rd Private Subnet for Application
resource "aws_subnet" "app-subnet-1" {
  vpc_id                  = aws_vpc.demovpc.id
  cidr_block              = var.subnet3_cidr
  map_public_ip_on_launch = "false"
  availability_zone       = "us-east-2a"
  tags = {
    Name = "Application Subnet 1"
  }
}

#Creating 4th Private subnet for Application
resource "aws_subnet" "app-subnet-2" {
  vpc_id                  = aws_vpc.demovpc.id
  cidr_block              = var.subnet4_cidr
  map_public_ip_on_launch = "false"
  availability_zone       = "us-east-2b"
  tags = {
    Name = "Application Subnet 2"
  }
}

#Creating 5th Private Subnet for DataBase
resource "aws_subnet" "db-subnet-1" {
  vpc_id                  = aws_vpc.demovpc.id
  cidr_block              = var.subnet5_cidr
  map_public_ip_on_launch = "false"
  availability_zone       = "us-east-2a"
  tags = {
    Name = "DataBase Subnet 1"
  }
}


#Creating 6th Private Subnet for DataBase
resource "aws_subnet" "db-subnet-2" {
  vpc_id                  = aws_vpc.demovpc.id
  cidr_block              = var.subnet6_cidr
  map_public_ip_on_launch = "false"
  availability_zone       = "us-east-2b"
  tags = {
    Name = "Database Subnet 2"
  }
}

