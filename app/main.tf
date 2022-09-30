#Configure provider and plugin
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region     = var.region
  access_key = "AKIA5HPA5JMVTNETQKWJ"
  secret_key = "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"
}

#provide script to run on instance creation
#in this particular case nginx will be automatically installed on the instance and a test webpage will be created
data "local_file" "user_data" {
  filename = "./scripts_to_execute/install_nginx.sh"
}


###############################
## Call Modules for this APP ##
###############################

#instance module
module "ec2" {
  source          = "../modules/ec2"
  instance_type   = var.instance_type
  name_of_project = var.name_of_project
  key_name        = module.ssh_keygen.output_keyname
  user_data       = data.local_file.user_data.content
}

#EBS Volume module
module "ebs_volume" {
  source            = "../modules/ebs_volume"
  availability_zone = module.ec2.output_ec2_az
  volume_size       = var.volume_size
  name_of_project   = var.name_of_project
}


#EBS Volume Association module
module "ebs_volume_attachment" {
  source      = "../modules/ebs_volume_attachment"
  volume_id   = module.ebs_volume.output_volume_ebs_id
  instance_id = module.ec2.output_ec2_id
}

#key generator module
module "ssh_keygen" {
  source          = "../modules/ssh_keygen"
  name_of_project = var.name_of_project
}

#eip module
module "eip" {
  source          = "../modules/eip"
  name_of_project = var.name_of_project
}

#eip association
module "eip_association" {
  source        = "../modules/eip_association"
  instance_id   = module.ec2.output_ec2_id
  allocation_id = module.eip.output_eip_id
}

#sg creation
module "security_group" {
  source           = "../modules/security_group"
  name_of_project  = var.name_of_project
  sg_ingress_ports = var.sg_ingress_ports
  sg_egress_ports  = var.sg_egress_ports
}

#sg association
module "sg_association" {
  source                                = "../modules/sg_association"
  security_group_id                     = module.security_group.output_security_group_id
  instance_primary_network_interface_id = module.ec2.output_primary_network_interface_id
}