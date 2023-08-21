data "aws_subnets" "private_subnets" {
  filter {
    name   = "tag:Name"
    values = ["*${var.subnet_scope}*"]
  }
}

# Seleciona a primeira subnet da lista retornada
data "aws_subnet" "private_subnet" {
  id = element(data.aws_subnets.private_subnets.ids, 0)
}