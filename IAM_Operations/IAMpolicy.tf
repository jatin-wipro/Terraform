#add multiple iam user
variable "username" {
  type = "list"
  default = ["prashant","pankaj","ashish"]
}

resource "aws_iam_user" "example" {
  count = "${length(var.username)}"
  name = "${element(var.username,count.index )}"
}
