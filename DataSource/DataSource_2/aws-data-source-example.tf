data "aws_vpc" "check_vpc" {

  filter {
    name   = "tag:Name"
    values = ["macd"]
  }
}

output "foo" {
  value = data.aws_vpc.check_vpc
}

data "aws_instance" "check_instance" {

  filter {
    name   = "tag:Name"
    values = ["Terra"]
  }
}

output "boo" {
  value = data.aws_instance.check_instance
}

