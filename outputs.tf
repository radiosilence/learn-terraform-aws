


output "base_url" {
  description = "The base URL of the API Gateway."
  value       = aws_apigatewayv2_stage.lambda.invoke_url
}

output "hello_url" {
  description = "The URL of the hello route."
  value       = "${aws_apigatewayv2_stage.lambda.invoke_url}hello"
}

output "hello_person_url" {
  description = "The URL of the hello/{name} route."
  value       = "${aws_apigatewayv2_stage.lambda.invoke_url}hello/baz"
}
