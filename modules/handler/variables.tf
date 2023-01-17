variable "api" {
  description = "The API Gateway."
  type = object({
    id            = string
    execution_arn = string
    name          = string
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

variable "filename" {
  type        = string
  description = "The path to handler package"
}

variable "handler" {
  type        = string
  description = "The handler function"
  default     = "index.handler"
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

variable "prefix" {
  type        = string
  description = "The prefix to use for all resources."
  default     = ""
}
