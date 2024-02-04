#!/bin/bash
sudo yum update 
sudo yum install httpd -y
sudo yum install git -y
sudo systemctl start httpd
sudo systemctl enable httpd
git clone https://github.com/GOUSERABBANI44/ecomm.git
sudo mv ecomm/* /var/www/html/
sudo systemctl restart httpd
