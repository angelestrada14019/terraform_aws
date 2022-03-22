output "module_instance_ip" {
  value = "ssh -i ../clave-prueba-ansible-ajea14019.pem ec2-user@${module.instance_module.instance_ip}"
}
