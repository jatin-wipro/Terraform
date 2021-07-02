resource "aws_s3_bucket" "onebucket" {
   bucket = "bucket-s3-capgemini"
   acl = "private"
   versioning {
      enabled = true
   }
   tags = {
     Name = "Bucket1"
     Environment = "Test"
   }
}
