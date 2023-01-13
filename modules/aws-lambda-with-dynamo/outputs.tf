output "arn" {
  description = "The ARN of the lambda function."
  value       = aws_lambda_function.lambda.arn
}

output "function_name" {
  description = "The name of the lambda function."
  value       = aws_lambda_function.lambda.function_name
}

output "log_group_arn" {
  description = "The ARN of the log group."
  value       = aws_cloudwatch_log_group.lambda.arn
}
