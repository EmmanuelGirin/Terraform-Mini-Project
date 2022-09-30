#Create our own key pairs in amazon. Terraform will attempt to overwrite the key if it already exists under that name
resource "aws_key_pair" "deployer" {
  key_name   = "${var.name_of_project}"
  public_key = tls_private_key.private-key.public_key_openssh
  tags = {
    Name        = "${var.name_of_resource}-${var.name_of_project}"
    Project     = "${var.name_of_project}"
  }
}

#Generate key
resource "tls_private_key" "private-key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

#Build Local file
resource "local_file" "emmanuel-private-pem" {
  content         = tls_private_key.private-key.private_key_pem
  filename        = "./ssh_keys/${var.name_of_project}.pem"
  file_permission = "0600"
}