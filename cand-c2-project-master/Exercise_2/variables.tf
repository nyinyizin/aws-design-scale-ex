# TODO: Define the variable for aws_region
variable "region" {
  description = "AWS Region"
  type        = string
  default     = "ap-southeast-1"
}
variable "lambda_name" {
  default = "greet_lambda"
}
variable "lambda_output_path" {
  default = "output.zip"
}