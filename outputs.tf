

output "function_arn" {
  description = "The ARN of the lambda function."
  value       = module.lambda_hello_world.arn
}


output "function_name" {
  description = "The name of the lambda function."
  value       = module.lambda_hello_world.function_name
}

output "base_url" {
  description = "The base URL of the API Gateway."
  value       = aws_apigatewayv2_stage.lambda.invoke_url
}
