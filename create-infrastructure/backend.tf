terraform {
  backend "s3" {
    bucket     = "s3-for-app"
    region     = "us-east-2"
    key        = "terraform.tfstate"
  }
}

