provider "aws" {
  region = "us-east-1" 
}
resource "aws_subnet" "subnet_ajea14019" {
   vpc_id = var.vpc_id
   cidr_block = var.cidr_block
   tags = var.tags
  
}