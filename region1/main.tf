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


data "aws_route53_zone" "main_zone" {
    name = "valrat.me"
}

resource "aws_route53_record" "app_global" {
    zone_id = data.aws_route53_zone.main_zone.zone_id
    name = "app"
    type = "A"
    set_identifier = "APP-GLOBAL"
    records = ["1.1.1.1"]
    ttl = 300

    geolocation_routing_policy {
      country = "*"
    }

}

resource "aws_route53_record" "app_zone" {
    zone_id = data.aws_route53_zone.main_zone.zone_id
    name = "app"
    type = "A"
    set_identifier = "APP-NA"
    records = ["1.1.1.1"]
    ttl = 300

    geolocation_routing_policy {
        continent = "NA"
    }
}