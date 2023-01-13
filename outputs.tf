
output "another_lambda_arn" {
  description = "The ARN of the lambda function."
  value       = module.another_lambda.arn
}

output "my_lambda_arn" {
  description = "The ARN of the lambda function."
  value       = module.my_lambda.arn
}
