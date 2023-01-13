
module "lambda_hello_world" {
  source   = "./modules/aws-lambda-with-dynamo"
  filename = "./lambda/build/demo/hello/package.zip"
  name     = "jc-lambda-test-${var.env}"

  aws_region = var.aws_region

  tables = {
    visitors = aws_dynamodb_table.visitors
  }
}
