output "invoke_url" {
  description = "The URL to invoke the API Gateway."
  value       = aws_apigatewayv2_stage.api.invoke_url
}
