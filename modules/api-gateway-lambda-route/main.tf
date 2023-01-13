
resource "aws_apigatewayv2_integration" "integration" {
  api_id = var.api_id

  integration_uri    = var.invoke_arn
  integration_type   = "AWS_PROXY"
  integration_method = "POST"
}

resource "aws_apigatewayv2_route" "route" {
  api_id = var.api_id

  route_key = var.route_key

  target = "integrations/${aws_apigatewayv2_integration.integration.id}"
}

