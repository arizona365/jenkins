terraform {
  backend "s3" {
    bucket = "keskinterraform"
    key    = "terraformstate/vpc-module.tfstate"
    region = "us-east-1"
  }
}