#Creating Security Group for Load Balancer
resource "aws_security_group" "lb_SG" {
  vpc_id = aws_vpc.demovpc.id

  # Inbound Rule: HTTP access from anywhere
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = [var.anywhere_cidr]
  }

  #Outbound Rule
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
