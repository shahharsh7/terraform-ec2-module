terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.9.0"
    }
  }
}
provider "aws" {
      region = var.aws_region
}
resource "aws_instance" "Harsh-Amazon-Linux-instance" {
    count = 1
    ami = "ami-0ded8326293d3201b"
    instance_type = var.instance_type
    key_name = "Nishant-Keypair"
    user_data = file("apache.sh")
    tags = {
        Name = "Harsh machine no ${count.index +1}"
    }
}
