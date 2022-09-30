region          = "us-east-2"
instance_type   = "t2.micro"
name_of_project = "Emmanuel-aws"
volume_size     = 2
#added ssh for fun
sg_egress_ports  = [80, 443, 22]
sg_ingress_ports = [80, 443, 22]