variable "name" {
    description = "The name of the server or service"
    default = "test-bivey"
}

variable "aws_region" {
    description = "EC2 Region for the VPC"
    default = "us-west-1"
}

variable "instance_type" {
    description = "The default size of the smallest ami"
    default = "t3a.micro"
}

variable "default_key" {
    description = "The default key pair for the account/server"
    default = "mandrill"
}

variable "tags" {
  description = "A map of tags to add to all resources"
  type = map
  default = {
    Project     = "mandrill"
    Environment = "mandrill-tools"
    Owner       = "dcmteam@mailchimp.com"
    ReviewDate  = "2021-08-31"
    Role        = "bastion"
    Region      = "us-west-1"
    Terraform   = "true"
  }
}
