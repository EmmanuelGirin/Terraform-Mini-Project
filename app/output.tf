output "instance_ip_address" {
  value = module.eip.output_eip
}

output "instance_type" {
  value = module.ec2.output_instance_type
}
