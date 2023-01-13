
resource "aws_dynamodb_table" "potato" {
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
