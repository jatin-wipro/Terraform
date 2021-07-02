resource "aws_instance" "remote" {
 ami = "${lookup(var.ami_id , var.region)}"
 instance_type = "t2.micro"
 key_name = "saturday"
 vpc_security_group_ids = [aws_security_group.allow_ssh.id]
 tags = { 
 Name = "remote"
 }

provisioner "file" {
 source = "/home/ubuntu/saturday.pem"
 destination = "/tmp/saturday.pem"
}


connection {
 type = "ssh"
 user = "ec2-user"
 private_key = file("${var.private_key_path}")
 host = "${aws_instance.remote.public_ip}"
 }
}
