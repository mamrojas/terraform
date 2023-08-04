#security group for launch_template
#allowing http and ssh
resource "aws_security_group" "sg_lt" {
  name        = "sg_lt"
  description = "Allow traffic"
  vpc_id      = "vpc-0b515261e92b2c2ee"

  ingress {
    description = "http"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = [var.cidr_vpc]
  }

  ingress {
    from_port   = 22
    to_port     = 22
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