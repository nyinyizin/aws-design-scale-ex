# TODO: Define the variable for aws_region
variable "region" {
  description = "AWS Region"
  type        = string
  default     = "ap-southeast-1"
}
variable "lambda_name" {
  description = "Lambda Function Name"
  type        = string
  default     = "greet_lambda"
}
variable "lambda_output_path" {
  description = "Lambda function Output File Path"
  type        = string
  default     = "output.zip"
}

variable "tags" {
  description = "A mapping of tags to assign to the Lambda function and all resources supporting tags."
  default     = {}
  type        = map(string)
}

variable "timeout" {
  description = "The amount of time your Lambda Function has to run in seconds."
  default     = 3
  type        = number
}

variable "lambda_at_edge" {
  description = "Enable Lambda@Edge for your Node.js or Python functions. Required trust relationship and publishing of function versions will be configured."
  default     = false
  type        = bool
}