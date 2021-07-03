variable "region" {
 type = string
 default = "us-east-2"
}

variable "ami_id" {
 type = map
 default = {
 "us-east-2" = "ami-0277b52859bac6f4b"
 }
}
