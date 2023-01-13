locals {
  name_safe = replace(replace(replace(replace(var.route_key, " ", ""), "/", "-"), "{", ""), "}", "")
}
module "lambda" {
  source   = "../aws-lambda-with-dynamo"
  filename = "./lambda/build/${var.handler}/package.zip"
  name     = "${local.name_safe}-${var.env}"

  aws_region = var.aws_region
  tables     = var.tables
}

module "route" {
  source = "../api-gateway-lambda-route"

  route_key = var.route_key
  lambda    = module.lambda
  api       = var.api
}
