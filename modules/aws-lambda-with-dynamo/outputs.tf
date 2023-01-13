output "arn" {
  description = "The ARN of the lambda function."
  value       = aws_lambda_function.lambda.arn
}

output "function_name" {
  description = "The name of the lambda function."
  value       = aws_lambda_function.lambda.function_name
}

output "invoke_arn" {
  description = "The ARN to be used for invoking Lambda Function from API Gateway - to be used in aws_api_gateway_integration's uri."
  value       = aws_lambda_function.lambda.invoke_arn
}

output "log_group_arn" {
  description = "The ARN of the log group."
  value       = aws_cloudwatch_log_group.lambda.arn
}
