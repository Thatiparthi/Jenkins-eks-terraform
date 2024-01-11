terraform {
  backend "s3" {
    bucket = "test351"
    key    = "eks/terraform.tfstate"
    region = "us-east-1"
  }
}