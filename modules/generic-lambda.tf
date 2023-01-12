
resource "aws_lambda_function" "baz_lambda" {
  # If the file is not in the current working directory you will need to include a
  # path.module in the filename.
  filename      = "./lambda/package/src/baz-lambda.ts.zip"
  function_name = "my-lambda"
  role          = aws_iam_role.iam_for_lambda.arn
  handler       = "index.handler"
  depends_on = [
  ]

  # The filebase64sha256() function is available in Terraform 0.11.12 and later
  # For Terraform 0.11.11 and earlier, use the base64sha256() function and the file() function:
  # source_code_hash = "${base64sha256(file("lambda_function_payload.zip"))}"
  source_code_hash = filebase64sha256("./lambda/package/src/baz-lambda.ts.zip")

  runtime = "nodejs16.x"

  environment {
    variables = {
      BAZ_TABLE_NAME = aws_dynamodb_table.baz_table.name
    }
  }
}
