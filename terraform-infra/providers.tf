provider "aws" {
  region = "eu-north-1"
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

#creating up a remote state backend in s3
terraform {
  backend "s3" {
    bucket = "mrtfbucket1"
    key    = "dev/terraform.tfstate"
    region = "eu-north-1"
  }
}