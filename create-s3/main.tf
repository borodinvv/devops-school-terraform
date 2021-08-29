provider "aws" {
  region = "us-east-2"
}

resource "aws_s3_bucket" "s3_bucket_app" {
  bucket = "${var.s3_bucket_name}"

 #  lifecycle {
 #    prevent_destroy = true
 # }

  versioning {
    enabled = true
 }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
}


