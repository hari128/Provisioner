terraform {
  backend "s3" {
    bucket = "terraformh"
    key    = "devopsb16.tfstate"
    region = "us-east-1"
    dynamodb_table = "devopsb16-terraform-state-lock"
  }
}