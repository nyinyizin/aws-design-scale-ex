variable "instance_name" {
  description = "Value of the Name tag for the EC2 instance"
  type        = string
  default     = "Udacity T2"
}

variable "m4instance_name" {
  description = "Value of the Name tag for the EC2 instance"
  type        = string
  default     = "Udacity M4"
}
variable "region" {
  description = "AWS Region"
  type        = string
  default     = "ap-southeast-1"
}
