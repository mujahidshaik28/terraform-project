# Creating Launch Configuration
resource "aws_launch_configuration" "demo-lc" {
  name            = "demo-launch-config"
  image_id        = "ami-0cf7b2f456cd5efd4"
  instance_type   = "t2.micro"
  key_name        = "demo-key"
  security_groups = [aws_security_group.demoec2SG.id]
}

# Creating Auto Scaling Group
resource "aws_autoscaling_group" "demo-asg" {
  desired_capacity     = 3
  max_size             = 5
  min_size             = 2
  vpc_zone_identifier  = [aws_subnet.web-subnet-1.id, aws_subnet.web-subnet-2.id]
  launch_configuration = aws_launch_configuration.demo-lc.id

  health_check_type         = "ELB"
  health_check_grace_period = 60
  force_delete              = true

  tag {
    key                 = "Name"
    value               = "Demo Auto Scaling"
    propagate_at_launch = true
  }

  lifecycle {
    create_before_destroy = true
  }
}

# attach autoscaling to load balancer
resource "aws_autoscaling_attachment" "as-lb" {
  autoscaling_group_name = aws_autoscaling_group.demo-asg.name
  lb_target_group_arn    = aws_lb_target_group.demo-lb-tg.arn
}


