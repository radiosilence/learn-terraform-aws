


output "base_url" {
  description = "The base URL of the API Gateway."
  value       = module.api.invoke_url
}

output "hello_url" {
  description = "The URL of the hello route."
  value       = "${module.api.invoke_url}hello"
}

output "hello_person_url" {
  description = "The URL of the hello/{name} route."
  value       = "${module.api.invoke_url}hello/baz"
}
