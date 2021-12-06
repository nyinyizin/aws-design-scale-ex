terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 0.14.0"
}

provider "aws" {
  profile = "default"
  region  = var.region
}


data "archive_file" "lambda_file" {
  type        = "zip"
  source_file = "greet_lambda.py"
  output_path = var.lambda_output_path
}

locals {
  timeout = var.lambda_at_edge ? min(var.timeout, 5) : var.timeout
}

resource "aws_iam_role" "lambda_execution_role" {
  name               = "lambda_execution_role"
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

resource "aws_cloudwatch_log_group" "lambdalog" {
  name              = "/aws/lambda${var.lambda_name}"
  retention_in_days = 14
}

resource "aws_iam_policy" "lambda_logs_policy" {
  name   = "lambda_logs_policy"
  path   = "/"
  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "logs:CreateLogGroup",
        "logs:CreateLogStream",
        "logs:PutLogEvents"
      ],
      "Resource": "arn:aws:logs:*:*:*",
      "Effect": "Allow"
    }
  ]
}
EOF

}

resource "aws_iam_policy_attachment" "lambda_logs_policy" {
  name       = "lambda_attachment"
  roles      = [aws_iam_role.lambda_execution_role.name]
  policy_arn = aws_iam_policy.lambda_logs_policy.arn
}

resource "aws_lambda_function" "greet_lambda" {
  function_name    = var.lambda_name
  filename         = data.archive_file.lambda_file.output_path
  source_code_hash = data.archive_file.lambda_file.output_base64sha256
  handler          = "greet_lambda.lambda_handler"
  runtime          = "python3.8"
  role             = aws_iam_role.lambda_execution_role.arn
  tags             = var.tags
  timeout          = local.timeout

  environment {
    variables = {
      greeting = "Hello This is lambda!!"
    }
  }

  depends_on = [aws_iam_policy_attachment.lambda_logs_policy, aws_cloudwatch_log_group.lambdalog]
}
