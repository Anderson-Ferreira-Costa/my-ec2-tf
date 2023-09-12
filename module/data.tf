data "aws_subnets" "subnets" {
  filter {
    name   = "tag:Name"
    values = ["*${var.subnet_scope}*"]
  }
}

# Seleciona a primeira subnet da lista
data "aws_subnet" "subnet" {
  id = element(data.aws_subnets.subnets.ids, 1)
}

data "aws_ami" "am2" {
  most_recent = true
  filter {
    name   = "name"
    values = ["amzn2-ami-kernel-5.10-hvm-2.0.*"]
  }
  filter {
    name   = "architecture"
    values = [var.architecture]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  owners = ["137112412989"]
}