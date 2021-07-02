resource "aws_security_group" "example" {
  name        = "for_each_example"
  description = "Allows access from friendly subnets"
  vpc_id      = var.vpc_id

  ingress {
    from_port = 0
    to_port   = 0
    protocol  = -1

 cidr_blocks = [
      for num in var.subnet_numbers:
      cidrsubnet(data.aws_vpc.example.cidr_block,12, num)
    ]
 }
}
