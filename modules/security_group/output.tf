output "output_security_group_tags" {
    value = aws_security_group.sec_group.tags_all
}
output "output_security_group_id" {
    value = aws_security_group.sec_group.id
}