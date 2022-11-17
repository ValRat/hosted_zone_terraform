terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.26.0"
    }
  }
}

provider "aws" {
  region  = "eu-west-1"
}


data "aws_route53_zone" "main_zone" {
    name = "valrat.me"
}

resource "aws_route53_record" "app_zone" {
    zone_id = data.aws_route53_zone.main_zone.zone_id
    name = "app"
    type = "A"
    set_identifier = "APP-EU"
    records = ["3.3.3.3"]
    ttl = 300

    geolocation_routing_policy {
        continent = "EU"
    }
}