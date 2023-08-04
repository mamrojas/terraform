#security group for the application load balancer
#allowing http and https
resource "aws_security_group" "sg_alb" {
  name        = "sg_alb"
  description = "Allow traffic"
  vpc_id      = "vpc-0b515261e92b2c2ee"

  ingress {
    description = "http"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = [var.cidr_open]
  }

  ingress {
    description = "https"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = [var.cidr_open]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [var.cidr_open]
  }
}