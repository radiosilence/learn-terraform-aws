variable "api" {
  description = "The API Gateway."
  type = object({
    id            = string
    execution_arn = string
  })
}

variable "env" {
  type        = string
  default     = "dev"
  description = "Environment"
}

variable "route_key" {
  description = "The route key for the route."
  type        = string
}

variable "handler" {
  type        = string
  description = "The path to handler function relative to handlers directory (e.g. demo/hello)"
}

variable "tables" {
  type = map(object({
    name : string,
    arn : string,
  }))
  description = "A map of DynamoDB table names and ARNs to attach to the lambda function."
  default     = {}
}

variable "runtime" {
  type        = string
  description = "The runtime environment for the Lambda function."
  default     = "nodejs18.x"
}

variable "memory_size" {
  type        = number
  description = "The amount of memory in MB your Lambda function can use at runtime."
  default     = 256
}

variable "aws_region" {
  type        = string
  description = "AWS region"
}
