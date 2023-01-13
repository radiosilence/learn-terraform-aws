terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.49.0"
    }
  }

}
provider "aws" {
  region = "us-west-2"
}

module "my_lambda" {
  source   = "./modules/aws-lambda-with-dynamo"
  filename = "./lambda/build/demo/hello/package.zip"
  name     = "jc-lambda-test-${var.env}"
  tables = {
    MY_TABLE     = aws_dynamodb_table.my_table
    POTATO_TABLE = aws_dynamodb_table.potato_table
  }
}

module "another_lambda" {
  source   = "./modules/aws-lambda-with-dynamo"
  filename = "./lambda/build/demo/hello/package.zip"
  name     = "jc-potato-test-${var.env}"
  tables = {
    MY_TABLE     = aws_dynamodb_table.my_table
    POTATO_TABLE = aws_dynamodb_table.potato_table
  }
}
