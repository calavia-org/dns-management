terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.0.0"
    }
  }

  required_version = ">= 1.1.7"

  cloud {
    organization = "calavia-org"
    workspaces {
      name = "dns-management"
    }
  }
}
provider "aws" {
  region = var.aws_region
}


resource "aws_route53_zone" "this" {
  for_each = var.create ? var.zones : tomap({})

  name          = lookup(each.value, "domain_name", each.key)
  comment       = lookup(each.value, "comment", null)
  force_destroy = lookup(each.value, "force_destroy", false)

  tags = merge(
    lookup(each.value, "tags", {}),
    var.tags
  )
}