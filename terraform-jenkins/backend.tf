terraform {
  backend "s3" {
    bucket = "keskinterraform"
    key    = "terraformstate/jenkins.tfstate"
    region = "us-east-1"
  }
}


