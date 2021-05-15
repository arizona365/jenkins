terraform {
  backend "s3" {
    bucket = "terraform-state-files-mcalik"
    key    = "tfstate/jenkins-pipeline.tfstate"
    region = "us-east-1"
  }
}