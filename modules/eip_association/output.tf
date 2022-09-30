output "instance_id" {
  value = aws_eip_association.eip_assoc.instance_id
}
output "eip_id" {
  value = aws_eip_association.eip_assoc.allocation_id
}