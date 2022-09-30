variable "name_of_resource" {
  type        = string
  default     = "ec2"
  description = "Declare a name for the resource tag"
}
variable "name_of_project" {
  type        = string
  default     = "project-aws"
  description = "Declare a name for the project tag"
}
variable "instance_type" {
  type        = string
  default     = "t2.nano"
  description = "Template for the deployment of the ec2 instance"
}
variable "key_name" {
  type = string
  default = ""
  description = "SSH Key Name"
}
variable "user_data" {
  type = string
  default = ""
  description = "Script to be executed at launch"
}