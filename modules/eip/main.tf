#Creates an EIP not linked to an instance
resource "aws_eip" "eip" {
  vpc = true
  tags = {
    Name = "${var.name_of_resource}-${var.name_of_project}"
    Project = var.name_of_project
  }
}