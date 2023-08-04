#creating a launch template with ubuntu ami and script for install
resource "aws_launch_template" "launch_template" {
  name          = "launch_template"
  image_id      = var.ami_id
  instance_type = var.instance_type
  user_data     = filebase64("apache.sh")
  vpc_security_group_ids = [aws_security_group.sg_lt.id]
}

#creating an auto scaling group
resource "aws_autoscaling_group" "asg_group" {
  name               = "asg_group"
  min_size           = 2
  max_size           = 5
  availability_zones = [var.availability_zone_a, var.availability_zone_b]
  target_group_arns  = [aws_lb_target_group.alb-targetgroup.arn]


  launch_template {
    id      = aws_launch_template.launch_template.id
    version = "$Latest"
  }
}

#creating an application load balancer
resource "aws_lb" "myLoadBalancer" {
  name               = "myLoadBalancer"
  internal           = false
  load_balancer_type = "application"
  subnets            = ["subnet-0735561317170c033", "subnet-02605a2c889accf70"]
  security_groups    = [aws_security_group.sg_alb.id]
}

#configuring and creating the listener for the lb
resource "aws_lb_listener" "front_end" {
  load_balancer_arn = "arn:aws:elasticloadbalancing:eu-north-1:730866780479:listener/app/tf-load-balancer/0508e8d10e724847/311d8f1b4ffc8464"
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.alb-targetgroup.arn
  }
}


#creating the alb target group
resource "aws_lb_target_group" "alb-targetgroup" {
  name     = "alb-targetgroup"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id
}
