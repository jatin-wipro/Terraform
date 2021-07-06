variable "region" {
  default = "us-east-2"
}
variable "ami_id" {
  type = map
  default = {
    us-east-2    = "ami-0277b52859bac6f4b"
    eu-west-2    = "ami-132b3c7efe6sdfdsfd"
    eu-central-1 = "ami-9787h5h6nsn"
  }
}
