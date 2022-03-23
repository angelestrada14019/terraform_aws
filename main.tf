
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
module "subnet_module"{
    source = "./modules/subnet"
    count=2
    vpc_id=module.vpc_module.id
    cidr_block=var.subnets_cidr[count.index]
    tags=var.subnets_tags[count.index] 

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
    count =3    
    tags=var.tags_ip_elastic[count.index]
  
}

module "nat_gateway_module" {
    source = "./modules/nat_gatway"
    nat_gateway_id=module.elastic_ip_module[0].id
    subnet_id=module.subnet_module[0].id
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
    subnet_id=module.subnet_module[0].id  
    route_table_id=module.route_table_module_public.id
}
module "private_rt_association" {
    source = "./modules/rot_table_asso_subnet"
    subnet_id=module.subnet_module[1].id  
    route_table_id=module.route_table_module_private.id
}
module "sg_module" {
    source = "./modules/security_groups"
    count=2
    sg_name=var.name_sg[count.index]
    ingres_rules=var.ingres_rules[count.index]
    egress_rules=var.egress_rules[count.index]
    vpc_id=module.vpc_module.id
}
module "eip_asso_instance_module"{
    source = "./modules/eip_asso_instance"  
    count=2
    instance_id=module.instance_module[count.index].id
    eip_id=module.elastic_ip_module[count.index + 1].id
}



module "instance_module"{
    source = "./modules/instance" 
    count=2
    subnet_id=module.subnet_module[count.index].id
    instance_tags=var.instance_tags[count.index]
    security_groups=module.sg_module[count.index].id 
    user_data=var.user_data[count.index]

    ami_id=var.ami_id    
    instance_type=var.instance_type
    key_name=var.key_name
    
}


