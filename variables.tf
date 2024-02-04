#Defining VPC Variable
variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

#Defining 1st subnet variable
variable "subnet1_cidr" {
  default = "10.0.1.0/24"
}

#Defining 2nd subnet variable
variable "subnet2_cidr" {
  default = "10.0.2.0/24"
}

#Defining 3rd subnet variable
variable "subnet3_cidr" {
  default = "10.0.3.0/24"
}

#Defining 4th subnet variable
variable "subnet4_cidr" {
  default = "10.0.4.0/24"
}

#Defining 5th subnet variable
variable "subnet5_cidr" {
  default = "10.0.5.0/24"
}

#Defining 6th subnet variable
variable "subnet6_cidr" {
  default = "10.0.6.0/24"
}

#Defining Anywhere CIDR block Varibale 
variable "anywhere_cidr" {
  default = "0.0.0.0/0"
}

