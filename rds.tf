#Creating RDS 
resource "aws_db_subnet_group" "demo-rds" {
  name       = "demo rds"
  subnet_ids = [aws_subnet.db-subnet-1.id, aws_subnet.db-subnet-2.id]

  tags = {
    Name = "My DB subnet group"
  }
}

resource "aws_db_instance" "demo-rds-ec2" {
  allocated_storage      = 10
  db_subnet_group_name   = aws_db_subnet_group.demo-rds.name
  engine                 = "mysql"
  engine_version         = "8.0.35"
  instance_class         = "db.t2.micro"
  multi_az               = true
  username               = "admin123"
  password               = "Mujahidjani#28"
  skip_final_snapshot    = true
  vpc_security_group_ids = [aws_security_group.database_sg.id]
}

