# TODO: Designate a cloud provider, region, and credentials


# TODO: provision 4 AWS t2.micro EC2 instances named Udacity T2


# TODO: provision 2 m4.large EC2 instances named Udacity M4

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

resource "aws_instance" "Udacity_T2" {
  //ami           = "ami-f95875ab"
  ami           = "ami-0fed77069cd5a6d6c"
  instance_type = "t2.micro"
  count         = "4"

  tags = {
    Name = var.instance_name
  }
}

# resource "aws_instance" "Udacity_M4" {
#   //ami           = "ami-f95875ab"
#   ami           = "ami-0fed77069cd5a6d6c"
#   instance_type = "m4.large"
#   count         = "2"

#   tags = {
#     Name = var.m4instance_name
#   }
# }