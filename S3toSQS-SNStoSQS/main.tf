#create sns topic

resource "aws_sns_topic" "user_updates" {
  name ="user-updates-topic"
}


#create sqs queue with s3 event notification

resource "aws_sqs_queue" "queue" {
 name = "s3-event-notification-queue"

 policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "sqs:SendMessage"
      ],
      "Effect": "Allow",
      "Resource": "arn:aws:sqs:us-east-2:346943284710:s3-event-notification-queue",
      "Principal": "*",
      "Condition": {
        "ArnEquals": { "aws:SourceArn": "${aws_s3_bucket.bucket.arn}" }
     }
   } 
  ]
}
POLICY
}

#random string name generator

resource "random_string" "id" {
 length = "5"
 special = false
 upper = false
}

#create s3 bucket

resource "aws_s3_bucket" "bucket" {
bucket = "mybucket-s3-g2-${random_string.id.result}"
}


#create s3 bucket to sqs notification
resource "aws_s3_bucket_notification" "bucket_notification" {
 bucket = "${aws_s3_bucket.bucket.id}"

  queue {
     queue_arn = "${aws_sqs_queue.queue.arn}"
     events = ["s3:ObjectCreated:Put"]
     }
}


#create sns to sqs notification
resource "aws_sns_topic_subscription" "user_updates_sqs_target" {
  topic_arn = aws_sns_topic.user_updates.arn
  protocol  = "sqs"
  endpoint  = "arn:aws:sqs:us-east-2:346943284710:s3-event-notification-queue"
}
