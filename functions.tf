
module "lambda_hello_world" {
  source   = "./modules/aws-lambda-with-dynamo"
  filename = "./lambda/build/demo/hello/package.zip"
  name     = "jc-lambda-test-${var.env}"
  tables = {
    potato = aws_dynamodb_table.potato
  }
}
