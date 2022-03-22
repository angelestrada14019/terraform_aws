provider "aws" {
  region = "us-east-1" 
}
module "vpc_module" {
  source = "./modules/vpc"
    cidr_block=var.main_vpc_cidr
    tags=var.tags_vpc
}
module "ig_module" {
  source = "./modules/internet_gatway"
    vpc_id=module.vpc_module.id
    tags=var.tags_ig
}
module "subnet_publica" {
    source = "./modules/subnet"
    vpc_id=module.vpc_module.id
    cidr_block=var.public_subnets
    tags=var.tags_subnet_public 
}
module "subnet_privada" {
    source = "./modules/subnet"
    vpc_id=module.vpc_module.id
    cidr_block=var.private_subnets
    tags=var.tags_subnet_private
}
module "route_table_module_public" {
    source = "./modules/route_table"
    vpc_id=module.vpc_module.id
    cidr_block=var.cidr_block_route_table_public
    gateway_id=module.ig_module.id
    nat_gateway_id=null    
    tags=var.tags_route_table_public
}
module "elastic_ip_module" {
    source = "./modules/elastic_ip"    
    tags=var.tags_ip_elastic
  
}
module "elastic_ip_module_ec2" {
    source = "./modules/elastic_ip"    
    tags=var.tags_ip_elastic_ec2
  
}
module "nat_gateway_module" {
    source = "./modules/nat_gatway"
    nat_gateway_id=module.elastic_ip_module.id
    subnet_id=module.subnet_publica.id
    tags=var.tags_nat_gateway
}
module "route_table_module_private" {
    source = "./modules/route_table"
    vpc_id=module.vpc_module.id
    cidr_block=var.cidr_block_route_table_private
    gateway_id=null
    nat_gateway_id=module.nat_gateway_module.id
    tags=var.tags_route_table_private
}
module "public_rt_association" {
    source = "./modules/rot_table_asso_subnet"
    subnet_id=module.subnet_publica.id  
    route_table_id=module.route_table_module_public.id
}
module "private_rt_association" {
    source = "./modules/rot_table_asso_subnet"
    subnet_id=module.subnet_privada.id  
    route_table_id=module.route_table_module_private.id
}
module "sg_module" {
    source = "./modules/security_groups"
    sg_name=var.name_sg
    ingres_rules=var.ingres_rules
    egress_rules=var.egress_rules
    vpc_id=module.vpc_module.id
}
module "eip_asso_instance_module"{
    source = "./modules/eip_asso_instance"  
    instance_id=module.instance_module.id
    eip_id=module.elastic_ip_module_ec2.id
}
module "instance_module"{
    source = "./modules/instance"  
    ami_id=var.ami_id    
    subnet_id=module.subnet_publica.id
    instance_type=var.instance_type
    intance_tags=var.instance_tags
    key_name=var.key_name
    security_groups=module.sg_module.id 
    
}

