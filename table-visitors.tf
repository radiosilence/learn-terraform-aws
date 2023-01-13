
locals {
  name = "jc-visitors"
}

resource "aws_dynamodb_table" "visitors" {
  name         = "${local.name}-${var.env}"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "name"

  attribute {
    name = "name"
    type = "S"
  }

  tags = {
    Name        = local.name
    Environment = var.env
  }
}
