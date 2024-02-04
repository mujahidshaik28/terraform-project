# Create Database Security Group

resource "aws_security_group" "database_sg" {
  name        = "Database-sg"
  description = "Allow inbound traffic from application layer"
  vpc_id      = aws_vpc.demovpc.id

  ingress {
    description     = "Allow traffic from application layer"
    from_port       = 3306
    to_port         = 3306
    protocol        = "tcp"
    security_groups = [aws_security_group.demoec2SG.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [var.anywhere_cidr]
  }


  tags = {
    Name = "Database SG"
  }
}

