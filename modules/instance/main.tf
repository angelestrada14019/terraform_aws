provider "aws" {
  region = "us-east-1" 
}
resource "aws_instance" "practica1_ajea14019" {   
    ami=var.ami_id
    instance_type = var.instance_type
    tags=var.intance_tags
    key_name = var.key_name
    subnet_id=var.subnet_id
    //ip auto assignation
    

    security_groups = [var.security_groups]
    #user_data = file("modulos/instance/user_data.yaml")
}
