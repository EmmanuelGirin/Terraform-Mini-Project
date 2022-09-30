variable "region" {
  type        = string
  default     = "us-east-1"
  description = "AWS Region for the deployment of the instrastructure"
}
variable "instance_type" {
  type        = string
  default     = "t2.nano"
  description = "Type of Instance -Template to use at start of instance"
}
variable "name_of_project" {
  type        = string
  default     = "project-aws"
  description = "Declare a name for the project tag"
}

###Passed to EBS Volume
variable "volume_size" {
  type        = number
  default     = 1
  description = "Declare a size in Gb for the EBS volume"
}

###Passed to Security Group
#ingress ports - http, https, and ssh by default
variable "sg_ingress_ports" {
  type        = list(number)
  default     = [80, 443]
  description = "list of ingress ports desired"
}
#egress ports - http, https, and ssh by default
variable "sg_egress_ports" {
  type        = list(number)
  default     = [80, 443]
  description = "list of egress ports desired"
}