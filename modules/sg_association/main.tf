#attach security group to instance
resource "aws_network_interface_sg_attachment" "sg_attachment" {
  security_group_id    = var.security_group_id
  network_interface_id = var.instance_primary_network_interface_id
}