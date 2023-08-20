variable "ami_id" {
  type    = string
  default = null
}
variable "instance_type" {
  type = string
}
variable "ec2_name" {
  type = string
}
variable "iam_instance_profile" {
  type = string
}
variable "subnet_id" {
  type = string
}
variable "vpc_id" {
  type = string
}
variable "region" {
  type = string
}
variable "volume_size" {
  type = string
}
variable "architecture" {
  type = string
}
variable "key_name" {
  type = string
  default = null
}