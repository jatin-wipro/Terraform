variable "vpc_id" {
 description = "ID for VPC"
}

variable "subnet_numbers" {
 description = "list of 8 bit numbers"
 default = [1,2,3,4,5,6]
}

variable "region" {
 type = string
 default = "us-east-2"
}


data "aws_vpc" "example" {
 id = var.vpc_id
}


