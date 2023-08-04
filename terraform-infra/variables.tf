variable "vpc_id" {
  type        = string
  description = "var for VPCID"
  default     = "aws-alb-group"
}

variable "cidr_open" {
  type        = string
  description = "CIDR block to allow traffic from anywhere"
  default     = "172.31.0.0/16"
}

variable "cidr_vpc" {
  type        = string
  description = "CIDR block to allow traffic from local machine"
  default     = "172.31.0.0/16"
}

variable "instance_type" {
  type        = string
  description = "var for instance type"
  default     = "t3.micro"
}

variable "ami_id" {
  type        = string
  description = "var for AMI ID"
  default     = "ami-02f01af6c21aad353"
}

variable "availability_zone_a" {
  type    = string
  default = "eu-north-1a"
}

variable "availability_zone_b" {
  type    = string
  default = "eu-north-1b"
}