locals {
  name_safe = replace(replace(replace(replace(replace(replace(var.route_key, " ", ""), "/", "-"), "{", ""), "}", ""), "+", ""), ".", "")
}

locals {
  name_full = "${var.prefix != "" ? "${var.prefix}-" : ""}${local.name_safe}-${var.env}"
}
module "lambda" {
  source   = "../aws-lambda-with-dynamo"
  filename = var.filename
  name     = local.name_full
  handler  = var.handler
  runtime  = var.runtime

  aws_region = var.aws_region
  tables     = var.tables
  tags = {
    Name        = local.name_safe
    Api         = var.api.name
    Environment = var.env
  }
}

module "route" {
  source = "../api-gateway-lambda-route"

  route_key = var.route_key
  lambda    = module.lambda
  api       = var.api
}
