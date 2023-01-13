variable "route_key" {
  description = "The route key for the route."
  type        = string
}


variable "lambda" {
  description = "The lambda function."
  type = object({
    function_name = string
    invoke_arn    = string
  })
}

variable "api" {
  description = "The API Gateway."
  type = object({
    id            = string
    execution_arn = string
  })
}

