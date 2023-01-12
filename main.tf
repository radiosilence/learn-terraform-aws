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
  filename = "./lambda/package/my-lambda.ts.zip"
  name     = "jc-lambda-test-${var.env}"
  tables = {
    MY_TABLE_TABLE_NAME = {
      name = aws_dynamodb_table.my_table.name
      arn  = aws_dynamodb_table.my_table.arn
    }
  }
}
