resource "aws_iam_role" "iam_for_lambda" {
  name                = "${var.api_name}_role"
  managed_policy_arns = ["arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"]
  assume_role_policy  = <<EOF
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
  inline_policy {
    name = "${var.api_name}_policy"
    policy = jsonencode({
      Version = "2012-10-17"
      Statement = [
        {
          Action = [
            "s3:Get*",
            "s3:List*"
          ]
          Effect = "Allow"
          Resource = [
            "*"
          ]
        }
      ]
    })
  }
}

data "aws_s3_object" "function_sha256" {
  bucket = var.lambda_bucket
  key    = var.lambda_key_sha256
}

resource "aws_lambda_function" "function" {
  architectures    = ["arm64"]
  s3_bucket        = var.lambda_bucket
  s3_key           = var.lambda_key
  function_name    = var.api_name
  description      = var.api_description
  role             = aws_iam_role.iam_for_lambda.arn
  handler          = "lambda_function.lambda_handler"
  source_code_hash = chomp(data.aws_s3_object.function_sha256.body)
  runtime          = "python3.9"
  timeout          = 3
  environment {
    variables = var.lambda_env_variables
  }
}
