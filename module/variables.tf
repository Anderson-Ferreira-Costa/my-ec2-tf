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
  type    = string
  default = null
}
variable "subnet_scope" {
  type    = string
  default = "private"
}
variable "create_private_key" {
  type    = bool
  default = false
}
variable "sg_ingress" {
  type = map(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
    description = optional(string)
  }))
}
variable "user_data" {
  type    = string
  default = null
}
