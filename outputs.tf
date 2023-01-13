

output "function_arn" {
  description = "The ARN of the lambda function."
  value       = module.hello_world.arn
}


output "function_name" {
  description = "The name of the lambda function."
  value       = module.hello_world.function_name
}
