variable "filename" {
  type        = string
  description = "The path to the zip file containing your deployment package."
}

variable "name" {
  type        = string
  description = "The name of the lambda function."
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
  default     = "nodejs16.x"
}

variable "memory_size" {
  type        = number
  description = "The amount of memory in MB your Lambda function can use at runtime."
  default     = 256
}
