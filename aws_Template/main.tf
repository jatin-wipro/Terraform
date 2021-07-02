provider "aws" {
  region = "${var.region}"
  access_key = "AKIAVBR3OMXTG6DBWTET"
  secret_key = "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"
}

resource "aws_instance" "web" {
  ami           = "${var.ami_id}"
  instance_type = "${var.instance_type}"

  tags = {
    Name = "${var.tag}"
  }
}
