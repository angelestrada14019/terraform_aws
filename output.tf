output "module_instance_ip" {
  value = "ssh -i ../clave-prueba-ansible-ajea14019.pem ec2-user@${module.elastic_ip_module[1].ip}"
}
output "connect_web" {
  value = "${module.elastic_ip_module[1].ip}:3000"
}
