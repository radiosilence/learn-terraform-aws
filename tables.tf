
resource "aws_dynamodb_table" "my_table" {
  name         = "jc-dynamo-test-${var.env}"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "id"
  range_key    = "name"

  attribute {
    name = "id"
    type = "S"
  }

  attribute {
    name = "name"
    type = "S"
  }

  tags = {
    Name        = "jc-dynamo-test"
    Environment = var.env
  }
}

resource "aws_dynamodb_table" "potato_table" {
  name         = "jc-potato-test-${var.env}"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "id"

  attribute {
    name = "id"
    type = "S"
  }

  tags = {
    Name        = "jc-potato-test"
    Environment = var.env
  }
}
