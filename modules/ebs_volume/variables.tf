variable "name_of_resource" {
  type        = string
  default     = "ebs"
  description = "Declare a name for the resource tag"
}
variable "name_of_project" {
  type        = string
  default     = "project-aws"
  description = "Declare a name for the project tag"
}
variable "volume_size" {
  type = number
  default = 1
  description = "Size of the volume in GBs"
}
variable "availability_zone" {
  type = string
  description = "Zone Location to create the volume"
}