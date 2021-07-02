variable "region" {
 type = string
 default = "us-east-2"
}

variable "vpc_cidr" {
 type = string
 default = "190.160.0.0/16"
}

variable "subnet_cidr" {
 type = list
 default = ["190.160.1.0/24" , "190.160.2.0/24" , "190.160.3.0/24"]
}

#variable "azs" {
# type = list
# default = ["us-east-2a" , "us-east-2b" , "us-east-2c"]
#}

data "aws_availability_zones" "azs" {}
