terraform {
  backend "s3" {
      bucket = "bucket-s3-capgemini"
      key = "module/terraform.tfstate"
      region = "us-east-2"
   }
}
