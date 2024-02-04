# Creating Elastic LoadBalancer: Application and External type
resource "aws_lb" "demo-lb" {
  name               = "external-LB"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.lb_SG.id]
  subnets            = [aws_subnet.web-subnet-1.id, aws_subnet.web-subnet-2.id]

}

resource "aws_lb_target_group" "demo-lb-tg" {
  name     = "alb-TG"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.demovpc.id

  health_check {
    path     = "/health"
    port     = 80
    protocol = "HTTP"
  }
}

resource "aws_lb_target_group_attachment" "attachment1" {
  target_group_arn = aws_lb_target_group.demo-lb-tg.arn
  target_id        = aws_instance.demo-instance-1.id
  port             = 80

  depends_on = [
    aws_lb_target_group.demo-lb-tg,
    aws_instance.demo-instance-1,
  ]
}

resource "aws_lb_target_group_attachment" "attachment2" {
  target_group_arn = aws_lb_target_group.demo-lb-tg.arn
  target_id        = aws_instance.demo-instance-2.id
  port             = 80

  depends_on = [
    aws_lb_target_group.demo-lb-tg,
    aws_instance.demo-instance-2,
  ]
}

resource "aws_lb_listener" "demo-listener-lb" {
  load_balancer_arn = aws_lb.demo-lb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.demo-lb-tg.arn
  }
}

