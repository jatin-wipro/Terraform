variable "region" {
  type = string
  default = "us-east-2"
}

variable "ami_id" {
  type = map
  default = {
    us-east-2 = "ami-0ba62214afa52bec7"
  }
}

variable "instance_type" {
  type = string
  default = "t2.micro"
}

variable "key_name"{
  type= string
  default="tuesday"
}
