


output "base_url" {
  description = "The base URL of the API Gateway."
  value       = module.api.invoke_url
}
