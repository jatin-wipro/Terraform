resource "aws_vpc" "main" {
  cidr_block = "${var.vpc_cidr}"
  instance_tenancy = "default"
  tags = {
   Name = "macd"
   Location = "Delhi"
 }
}


resource "aws_subnet" "subnets" { 
###count = "${length(var.azs)}" #####
   count = "${length(data.aws_availability_zones.azs.names)}"

  availability_zone = "${element(data.aws_availability_zones.azs.names,count.index)}"
  vpc_id = "${aws_vpc.main.id}"
  cidr_block = "${element(var.subnet_cidr,count.index)}"

  tags = {
### Name = "subnet-1"#######
    Name = "Subnet-${count.index+1}"
 }
}
