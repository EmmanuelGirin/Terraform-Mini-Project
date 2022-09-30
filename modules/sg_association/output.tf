output "security_group_id" {
  value = aws_network_interface_sg_attachment.sg_attachment.security_group_id
}
output "network_interface_id" {
  value = aws_network_interface_sg_attachment.sg_attachment.network_interface_id
}