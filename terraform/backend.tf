terraform {
  backend "s3" {
    bucket = "terraform-backend.dev.pro.edu4"
    key    = "terraform/backend"
    region = "eu-central-1"
  }
}