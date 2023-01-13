
module "route_hello_world" {
  source = "./modules/api-gateway-lambda-route"

  route_key = "GET /hello"
  lambda    = module.lambda_hello_world
  api       = aws_apigatewayv2_api.lambda

}

module "route_hello_world_person" {
  source = "./modules/api-gateway-lambda-route"

  route_key = "GET /hello/{name}"
  lambda    = module.lambda_hello_world
  api       = aws_apigatewayv2_api.lambda
}

