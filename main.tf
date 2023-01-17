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
      filename = "./lambda/build/demo/hello/package.zip"
      tables   = local.tables
    }
    "GET /hello/{name}" = {
      filename = "./lambda/build/demo/hello/package.zip"
      tables   = local.tables
    }
    "GET /hello/{name}/oh/wow-what_a/long.route/{potato+}" = {
      filename    = "./lambda/build/demo/hello/package.zip"
      tables      = local.tables
      memory_size = 1024
    }
    "GET /hello-go/{name}" = {
      filename = "./lambdago/handlers/demo/build/package.zip"
      handler  = "main"
      runtime  = "go1.x"
      tables   = local.tables
    }
  }
}
