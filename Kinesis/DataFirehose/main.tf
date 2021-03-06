provider "aws" {
  region = "us-east-2"
  access_key = "AKIAVBR3OMXTO72EQQOO"
  secret_key = "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"
}
[root@ip-172-31-5-38 firehose]# cat main.tf
resource "aws_s3_bucket" "bucket" {
  bucket = "tf-test-bucket-mcd"
  acl    = "private"
}

resource "aws_iam_role" "firehose_role" {
  name = "firehose_test_role"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "firehose.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_kinesis_firehose_delivery_stream" "test_stream" {
  name        = "terraform-kinesis-firehose-test-stream"
  destination = "s3"

  s3_configuration {
    role_arn   = aws_iam_role.firehose_role.arn
    bucket_arn = aws_s3_bucket.bucket.arn
  }
}
