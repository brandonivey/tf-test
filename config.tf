provider "aws" {
  region  = var.aws_region
  version = "~> 2.23"
}

provider "template" {
  version = "~> 2.1"
}

terraform {
  required_version = ">= 0.12"
}


data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    bucket = "mandrill-tf-state-west-1"
    key    = "mandrill-tools.vpc.tfstate"
    region = "us-west-1"
  }
}
