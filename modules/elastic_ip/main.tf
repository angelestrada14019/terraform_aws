provider "aws" {
  region = "us-east-1" 
}

resource "aws_eip" "NAT_EIP" {
vpc = true
tags = var.tags
}