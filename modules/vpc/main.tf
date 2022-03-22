provider "aws" {
  region = "us-east-1" 
}
resource "aws_vpc" "vpc_terraModule_ajea14019" {
    cidr_block = var.cidr_block
    instance_tenancy = "default"
    tags = var.tags
}
