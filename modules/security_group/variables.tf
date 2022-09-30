#Awaiting modification for mapping of port types to be implented later
#ingress ports - no default defined for security
variable "sg_ingress_ports" {
  type    = list(number)
  description = "list of ingress ports desired"
}
#egress ports - no default defined for security 
variable "sg_egress_ports" {
  type    = list(number)
  description = "list of egress ports desired"
}
variable "name_of_resource" {
  type        = string
  default     = "sec_group"
  description = "Declare a name for the resource tag"
}
variable "name_of_project" {
  type        = string
  default     = "project-aws"
  description = "Declare a name for the project tag"
}