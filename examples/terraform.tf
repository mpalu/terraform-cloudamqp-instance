terraform {
  backend "s3" {
    bucket = "bucket-name"
    key    = "cloudamqp/us-east-2/terraform.tfstate"
    region = "sa-east-1"
  }
}

