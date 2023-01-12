terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.49.0"
    }
  }

}
provider "aws" {
  region = "us-west-2"
}

# resource "null_resource" "my_lambda_bundle" {
#   provisioner "local-exec" {
#     command = "npx esbuild --bundle ./lambda/src/my-lambda.ts --target=node14 --format=cjs --external:aws-sdk --outfile=./lambda/build/index.js && (cd ./lambda/build && zip package.zip index.js)"
#   }

# }

resource "aws_iam_role" "iam_for_lambda" {
  name = "iam_for_lambda"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_iam_policy" "policy_for_lambda" {
  name        = "my-role"
  description = "My policy"

  policy = <<-EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
			"Effect": "Allow",
			"Action": [
				"dynamodb:BatchGetItem",
				"dynamodb:GetItem",
				"dynamodb:Query",
				"dynamodb:Scan",
				"dynamodb:BatchWriteItem",
				"dynamodb:PutItem",
				"dynamodb:UpdateItem"
			],
			"Resource": "${aws_dynamodb_table.my_table.arn}"
		}
  ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "test-attach" {
  role       = aws_iam_role.iam_for_lambda.name
  policy_arn = aws_iam_policy.policy_for_lambda.arn
}

resource "aws_lambda_function" "my_lambda" {
  # If the file is not in the current working directory you will need to include a
  # path.module in the filename.
  filename      = "./lambda/package/src/my-lambda.ts.zip"
  function_name = "my-lambda-${var.env}"
  role          = aws_iam_role.iam_for_lambda.arn
  handler       = "index.handler"
  depends_on = [
  ]

  # The filebase64sha256() function is available in Terraform 0.11.12 and later
  # For Terraform 0.11.11 and earlier, use the base64sha256() function and the file() function:
  # source_code_hash = "${base64sha256(file("lambda_function_payload.zip"))}"
  source_code_hash = filebase64sha256("./lambda/package/src/my-lambda.ts.zip")

  runtime = "nodejs16.x"

  environment {
    variables = {
      MY_TABLE_NAME = aws_dynamodb_table.my_table.name
    }
  }
}

