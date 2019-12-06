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
