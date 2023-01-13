
module "api" {
  source     = "./modules/aws-api"
  name       = "jc-api"
  env        = var.env
  aws_region = var.aws_region

  routes = {
    hello = {
      route_key = "GET /hello"
      handler   = "demo/hello"
      tables = {
        visitors = aws_dynamodb_table.visitors
      }
    }
    hello_name = {
      route_key = "GET /hello/{name}"
      handler   = "demo/hello"
      tables = {
        visitors = aws_dynamodb_table.visitors
      }
    }
  }
}
