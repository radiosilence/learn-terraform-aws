module "hello_handler" {
  source    = "./modules/handler"
  route_key = "GET /hello"
  handler   = "demo/hello"

  api        = aws_apigatewayv2_api.lambda
  aws_region = var.aws_region

  tables = {
    visitors = aws_dynamodb_table.visitors
  }
}

module "hello_name_handler" {
  source    = "./modules/handler"
  route_key = "GET /hello/{name}"
  handler   = "demo/hello"

  api        = aws_apigatewayv2_api.lambda
  aws_region = var.aws_region

  tables = {
    visitors = aws_dynamodb_table.visitors
  }
}
