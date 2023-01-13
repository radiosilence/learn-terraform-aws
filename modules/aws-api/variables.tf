variable "routes" {
  type = map(object({
    handler : string,
    route_key : string,
    tables : map(object({
      name : string,
      arn : string,
    }))
  }))
  description = "A map of routes to create."
  default     = {}
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
