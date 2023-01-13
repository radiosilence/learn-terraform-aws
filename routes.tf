
module "route_hello_world" {
  source = "./modules/api-gateway-lambda-route"

  api_id     = aws_apigatewayv2_api.lambda.id
  invoke_arn = module.lambda_hello_world.invoke_arn
  route_key  = "GET /hello"
}

module "route_hello_world_person" {
  source = "./modules/api-gateway-lambda-route"

  api_id     = aws_apigatewayv2_api.lambda.id
  invoke_arn = module.lambda_hello_world.invoke_arn
  route_key  = "GET /hello/{personId}"
}
