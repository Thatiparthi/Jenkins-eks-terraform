resource "aws_s3_bucket" "test" {
  bucket = var.bucket

  tags = {
    Name        = "test"
    Environment = var.environment
  }
}

resource "aws_s3_bucket_versioning" "versioning_example" {
  bucket = aws_s3_bucket.test.id
  versioning_configuration {
    status = "Enabled"
  }
}