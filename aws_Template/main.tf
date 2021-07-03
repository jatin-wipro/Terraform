provider "aws" {
  region = "${var.region}"
  access_key = "AKIAVBR3OMXTLHZS5CLV"
  secret_key = "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"
}

resource "aws_instance" "web" {
  ami           = "${var.ami_id}"
  instance_type = "${var.instance_type}"

  tags = {
    Name = "${var.tag}"
  }
}
