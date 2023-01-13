
resource "aws_apigatewayv2_integration" "integration" {
  api_id = var.api.id

  integration_uri    = var.lambda.invoke_arn
  integration_type   = "AWS_PROXY"
  integration_method = "POST"
}

resource "aws_apigatewayv2_route" "route" {
  api_id    = var.api.id
  route_key = var.route_key
  target    = "integrations/${aws_apigatewayv2_integration.integration.id}"
}

resource "aws_lambda_permission" "api_gw" {
  action        = "lambda:InvokeFunction"
  function_name = var.lambda.function_name
  principal     = "apigateway.amazonaws.com"
  source_arn    = "${var.api.execution_arn}/*/*"
}
