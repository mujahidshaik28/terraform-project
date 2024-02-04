# Creating file for Outputs

# Output of the LoadBalancer DNS link
output "lb_dns_name" {
  description = "The DNS name of the LB"
  value       = aws_lb.demo-lb.dns_name
}

# Output of the 1st Instance Public IP
output "public_ip_address_1" {
  description = "Public IP of 1st Instance"
  value       = aws_instance.demo-instance-1.public_ip
}

# Output of the 2nd Instance Public IP
output "public_ip_address_2" {
  description = "Public IP of 2nd Instance"
  value       = aws_instance.demo-instance-2.public_ip
}

