#Creating Internet Gateway for Demo VPC
resource "aws_internet_gateway" "demoigw" {
  vpc_id = aws_vpc.demovpc.id
}

