terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.50.0"
    }
  }

}

provider "aws" {
  region = var.aws_region
}

locals {
  tables = {
    visitors = aws_dynamodb_table.visitors
  }
}

module "api" {
  source     = "./modules/aws-api"
  name       = "jc-api"
  env        = var.env
  aws_region = var.aws_region

  routes = {
    "GET /hello" = {
      handler = "demo/hello"
      tables  = local.tables
    }
    "GET /hello/{name}" = {
      handler = "demo/hello"
      tables  = local.tables
    }
    "GET /hello/{name}/oh/wow-what_a/long.route/{potato+}" = {
      handler = "demo/hello"
      tables  = local.tables
    }
  }
}
