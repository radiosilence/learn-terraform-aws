
module "lambda_hello_world" {
  source   = "./modules/aws-lambda-with-dynamo"
  filename = "./lambda/build/demo/hello/package.zip"
  name     = "jc-lambda-test-${var.env}"
  tables = {
    MY_TABLE     = aws_dynamodb_table.my_table
    POTATO_TABLE = aws_dynamodb_table.potato_table
  }
}
