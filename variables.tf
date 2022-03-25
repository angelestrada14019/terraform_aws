variable "region" {
  default = "us-east-1"
}

variable "main_vpc_cidr" {
  description = "Nuestro Security Group"
  default     = "10.0.0.0/24"

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

variable "subnets_cidr" {
  default = [
    "10.0.0.128/26",
    "10.0.0.192/26"

  ]
}
variable "subnets_availability_zone" {
  default = [
    "us-east-1a",
    "us-east-1b"
  ]
}
variable "subnets_tags" {
  default = [
    {
      Name = "subnet-public-terraform_module-ajea14019"
    },
    {
      Name = "subnet-private-terraform_module-ajea14019"
    }
  ]
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
  default = [{
    Name = "elastic-ip-terraform_module-ajea14019"
     }
    # {
    #   Name = "elastic-ip-ec2-terraform_module-ajea14019"
    # },
    # {
    #   Name = "elastic-ip-ec2-private-terraform_module-ajea14019"
    # }
  ]
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
  default     = "ami-0e472ba40eb589f49"
  description = "ID de la imagen de Amazon"
  type        = string
}
variable "instance_type" {
  default     = "t2.micro"
  description = "Tipo de instancia"
  type        = string
}
# variable "instance_tags_name" {
#   default=[
#         "instance-public-terraform_module-ajea14019",
#         "instance-private-terraform_module-ajea14019"    
#   ]
# }
variable "instance_tags" {
  default = [
    {
      Name        = "practica1_ajea14019"
      Environment = "dev"
    },
    {
      Name        = "practica1_privada_ajea14019"
      Environment = "prod"
    }
  ]
  description = "Tags de la instancia"

}
variable "name_sg" {
  default = ["secu_group_prueba_ajea14019", "secu_group_prueba_privada_ajea14019"]

}
variable "ingres_rules" {
  default = [[
    {
      from_port = "22",
      to_port   = "22",
      protocol  = "tcp",
      cidr_blocks : ["0.0.0.0/0"]
    },
    {
      from_port = "3000",
      to_port   = "3000",
      protocol  = "tcp",
      cidr_blocks : ["0.0.0.0/0"]
    }
    ],
    [
      {
        from_port = "4478",
        to_port   = "4478",
        protocol  = "tcp",
        cidr_blocks : ["0.0.0.0/0"]
      }
    ]

  ]
  description = "Reglas de ingreso"
}
variable "egress_rules" {
  default = [
    [{
      from_port = 0,
      to_port   = 0,
      protocol  = "-1",
      cidr_blocks : ["0.0.0.0/0"]
      }
    ],
    [
      {
        from_port = 0,
        to_port   = 0,
        protocol  = "-1",
        cidr_blocks : ["0.0.0.0/0"]
      }
  ]]
  description = "Reglas de salida"
}
variable "key_name" {
  default = "clave-prueba-ansible-ajea14019"
}
variable "user_data" {
  default = ["scrip.sh", "scrip.sh"]
}

variable "name_db_group_subnet" {
  default = "db_subnet_group-ajea14019"
}
variable "tags_db_group_subnet" {
  default = {
    Name = "db_subnet_group-ajea14019"
  }
}

variable "allocated_storage" {
  default     = 10
}
variable "storage_type" {
  default     = "gp2"  
}
variable "engine" {
  default     = "mysql"
}
variable "engine_version" {
  default     = "8.0.19"
}
variable "instance_class" {
  default     = "db.t2.micro"
}
variable "name_db" {
  default     = "practica1_bd_RDS_ajea14019"
}
variable "username" {
  default     = "foo"
}
variable "password" {
  default     = "foobarbaz"
}
variable "availability_zone" {
  default     = "us-east-1b"
}
variable "parameter_group_name"{
    default     = "default.mysql8.0"
}