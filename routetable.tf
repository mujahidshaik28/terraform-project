# Creating Public Route Table for Demo VPC
resource "aws_route_table" "pub-rt" {
  vpc_id = aws_vpc.demovpc.id

  route {
    cidr_block = var.anywhere_cidr
    gateway_id = aws_internet_gateway.demoigw.id
  }

  tags = {
    Name = "Public Route Table"
  }
}

# Associating 1st Public Subnet with Public Route Table
resource "aws_route_table_association" "rt1" {
  subnet_id      = aws_subnet.web-subnet-1.id
  route_table_id = aws_route_table.pub-rt.id
}

# Associating 2nd Public Subnet with Public Route Table
resource "aws_route_table_association" "rt2" {
  subnet_id      = aws_subnet.web-subnet-2.id
  route_table_id = aws_route_table.pub-rt.id
}

