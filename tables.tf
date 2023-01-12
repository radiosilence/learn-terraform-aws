
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
