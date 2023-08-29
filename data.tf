data "aws_subnets" "subnets" {
  filter {
    name   = "tag:Name"
    values = ["*${var.subnet_scope}*"]
  }
}

# Seleciona a primeira subnet da lista
data "aws_subnet" "subnet" {
  id = element(data.aws_subnets.subnets.ids, 0)
}