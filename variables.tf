variable "region" {
  default ="us-east-1"
}

variable "main_vpc_cidr" {
description = "Nuestro Security Group"
default = "10.0.0.0/24"

}
variable "tags_vpc" {
    default = {
        Name = "vpc-terraform_module-ajea14019"
    }
}

variable "tags_ig" {
    default = {
        Name = "ig-terraform_module-ajea14019"
    }  
}
variable "public_subnets" {

description = "subnet con acceso a internet"
default = "10.0.0.128/26"

}
variable "tags_subnet_public" {
    default = {
        Name = "subnet-public-terraform_module-ajea14019"
    }
}

variable "private_subnets" {

description = "subnet sin acceso a internet"
default = "10.0.0.192/26"

}
variable "tags_subnet_private" {
    default = {
        Name = "subnet-private-terraform_module-ajea14019"
    }
}
variable "cidr_block_route_table_public" {
  default = "0.0.0.0/0"
}
variable "tags_route_table_public" {
    default = {
        Name = "route-table-public-terraform_module-ajea14019"
    }
}
variable "tags_ip_elastic" {
    default = {
        Name = "elastic-ip-terraform_module-ajea14019"
    }
}
variable "tags_ip_elastic_ec2" {
    default = {
        Name = "elastic-ip-ec2-terraform_module-ajea14019"
    }
}
variable "tags_nat_gateway" {
    default = {
        Name = "nat-gateway-terraform_module-ajea14019"
    }  
}
variable "cidr_block_route_table_private" {
    default = "0.0.0.0/0"
  
}
variable "tags_route_table_private" {
    default = {
        Name = "route-table-private-terraform_module-ajea14019"
    }
}

variable "ami_id" {
  default = "ami-0e472ba40eb589f49"
  description = "ID de la imagen de Amazon"
  type = string
}
variable "instance_type" {
  default = "t2.micro"
  description = "Tipo de instancia"
  type = string
}
variable "instance_tags" {
  default = {
    "Name" = "practica1_ajea14019"
    "Environment" = "dev"
  }
  description = "Tags de la instancia"
  type = map
}
variable "name_sg" {
  default = "secu_group_prueba_ajea14019"
  description = "Nombre del grupo de seguridad"
  type = string
}
variable "ingres_rules" {
  default = [
    {
      from_port= "22",
      to_port= "22",
      protocol= "tcp",
      cidr_blocks: ["0.0.0.0/0"]
    },
    {
      from_port= "3000",
      to_port= "3000",
      protocol= "tcp",
      cidr_blocks: ["0.0.0.0/0"]
    },
    {
      from_port= "80",
      to_port= "80",
      protocol= "tcp",
      cidr_blocks: ["0.0.0.0/0"]
    }]
    description = "Reglas de ingreso"    
}
variable "egress_rules" {
  default = [
    {
      from_port= 0,
      to_port= 0,
      protocol= "-1",
      cidr_blocks: ["0.0.0.0/0"]
    }]
    description = "Reglas de salida"    
}
variable "key_name" {
  default = "clave-prueba-ansible-ajea14019"
}
variable "user_data" {
  default="scrip.sh"
}