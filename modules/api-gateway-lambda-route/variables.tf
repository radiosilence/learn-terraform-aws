variable "api_id" {
  description = "The ID of the API Gateway Lambda."
  type        = string
}

variable "invoke_arn" {
  description = "The ARN to be used for invoking Lambda Function from API Gateway - to be used in aws_api_gateway_integration's uri."
  type        = string
}

variable "route_key" {
  description = "The route key for the route."
  type        = string
}
