resource "aws_security_group" "this" {
  name   = "${var.ec2_name}_sg"
  vpc_id = data.aws_subnet.subnet.vpc_id

  dynamic "ingress" {
    for_each = var.sg_ingress

    content {
      from_port   = ingress.value.from_port
      to_port     = ingress.value.to_port
      protocol    = ingress.value.protocol
      cidr_blocks = ingress.value.cidr_blocks
      description = ingress.value.description
    }
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}