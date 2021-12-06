# TODO: Define the output variable for the lambda function.

# cloudwatch_log_group_arn = "arn:aws:logs:ap-southeast-1:xxxxxxxxxxxx:log-group:/aws/lambdagreet_lambda"
# cloudwatch_log_group_name = "/aws/lambdagreet_lambda"
# function_name = "greet_lambda"
# invoke_arn = "arn:aws:apigateway:ap-southeast-1:lambda:path/2015-03-31/functions/arn:aws:lambda:ap-southeast-1:xxxxxxxxxxxx:function:greet_lambda/invocations"
# lambda_function_arn = "arn:aws:lambda:ap-southeast-1:xxxxxxxxxxxx:function:greet_lambda"
# role_name = "lambda_execution_role"
# version = "$LATEST"


output "lambda_function_arn" {
  description = "The Amazon Resource Name (ARN) identifying your Lambda Function."
  value       = aws_lambda_function.greet_lambda.arn
}

output "cloudwatch_log_group_name" {
  description = "The name of the CloudWatch log group used by your Lambda function."
  value       = aws_cloudwatch_log_group.lambdalog.name
}

output "cloudwatch_log_group_arn" {
  description = "The Amazon Resource Name (ARN) identifying the CloudWatch log group used by your Lambda function."
  value       = aws_cloudwatch_log_group.lambdalog.arn
}

output "function_name" {
  description = "The unique name of your Lambda Function."
  value       =  aws_lambda_function.greet_lambda.function_name
}

output "invoke_arn" {
  description = "The ARN to be used for invoking Lambda Function from API Gateway - to be used in aws_api_gateway_integration's uri"
  value       =  aws_lambda_function.greet_lambda.invoke_arn
}

output "role_name" {
  description = "The name of the IAM role attached to the Lambda Function."
  value       = aws_iam_role.lambda_execution_role.name
}

output "version" {
  description = "Latest published version of your Lambda Function."
  value       =  aws_lambda_function.greet_lambda.version
}