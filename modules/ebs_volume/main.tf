#Creates an EIP not linked to an instance
resource "aws_ebs_volume" "ebs_volume" {
  availability_zone = var.availability_zone
  size              = var.volume_size

  tags = {
    Name    = "${var.name_of_resource}-${var.name_of_project}"
    Project = var.name_of_project
  }
}