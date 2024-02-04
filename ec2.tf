# Creating Public EC2 Instances for Presentation Layer
# Creating 1st Public Subnet
resource "aws_instance" "demo-instance-1" {
  ami                         = "ami-0cf7b2f456cd5efd4"
  instance_type               = "t2.micro"
  key_name                    = "demo-key"
  vpc_security_group_ids      = [aws_security_group.demoec2SG.id]
  subnet_id                   = aws_subnet.web-subnet-1.id
  associate_public_ip_address = true
  user_data                   = file("data1.sh")

  tags = {
    Name = "Public Instance 1"
  }
}


# Creating 2nd Public Subnet
resource "aws_instance" "demo-instance-2" {
  ami                         = "ami-0cf7b2f456cd5efd4"
  instance_type               = "t2.micro"
  key_name                    = "demo-key"
  vpc_security_group_ids      = [aws_security_group.demoec2SG.id]
  subnet_id                   = aws_subnet.web-subnet-2.id
  associate_public_ip_address = true
  user_data                   = file("data2.sh")

  tags = {
    Name = "Public Instance 2"
  }
}
