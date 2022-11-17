terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.26.0"
    }
  }
}

provider "aws" {
    region  = "us-west-2"
}


resource "aws_route53_zone" "main_zone" {
    name = "valrat.me"
}