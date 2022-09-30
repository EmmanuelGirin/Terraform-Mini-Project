#Create security group
resource "aws_security_group" "sec_group" {
  name = "${var.name_of_resource}-${var.name_of_project}"
  description = "custom security group"

  tags = {
    Name        = "${var.name_of_resource}-${var.name_of_project}"
    Project     = "${var.name_of_project}"
  }

  #assign inbound rules dynamically
  dynamic "ingress" {
    for_each = var.sg_ingress_ports
    content {
      description      = "${ingress.value} from VPC"
      from_port        = ingress.value
      to_port          = ingress.value
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]
    }
  }

  dynamic "egress" {
    for_each = var.sg_egress_ports
    content {
      from_port        = egress.value
      to_port          = egress.value
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]
    }
  }
}