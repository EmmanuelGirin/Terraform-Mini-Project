variable "volume_id" {
  type        = string
  description = "ID of EBS Volume"
}
variable "instance_id" {
  type        = string
  description = "ID of ec2-instance"
}
variable "device_name" {
  type = string
  description = "name of the device on instance"
  default = "/dev/sdh"
}