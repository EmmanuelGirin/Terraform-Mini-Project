#Retrieve an AWS Linux ami based on region
data "aws_ami" "ami_awslinux" {
  most_recent = true

  owners = ["amazon"]
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm*"]
  }
}

#Create an ec2 instance
resource "aws_instance" "instance-ec2" {
  ami           = data.aws_ami.ami_awslinux.id # us-east-1
  instance_type = var.instance_type

  #pass SSH key
  key_name      = var.key_name

  #pass user data script
  user_data     = var.user_data

  tags = {
    Name    = "${var.name_of_resource}-${var.name_of_project}"
    Project = var.name_of_project
  }
}