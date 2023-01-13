
variable "name" {
  type        = string
  description = "The name of the API Gateway."
}

variable "env" {
  type        = string
  default     = "dev"
  description = "Environment"
}

variable "aws_region" {
  type        = string
  description = "AWS region"
}

variable "routes" {
  type = map(object({
    handler : string,
    route_key : string,
    memory_size : optional(number, 256),
    tables : optional(map(object({
      name : string,
      arn : string,
    })), {})
  }))
  description = "A map of routes to create."
  default     = {}
}
