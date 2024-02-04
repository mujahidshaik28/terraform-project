#creating virtual private cloud VPC
resource "aws_vpc" "demovpc" {
  cidr_block       = var.vpc_cidr
  instance_tenancy = "default"
  tags = {
    Name    = "Demo VPC"
    Project = "Terraform"
  }
}
