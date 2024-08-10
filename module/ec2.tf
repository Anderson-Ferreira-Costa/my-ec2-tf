resource "aws_instance" "this" {
  ami                    = var.ami_id != null ? var.ami_id : data.aws_ami.am2.id
  instance_type          = var.instance_type
  iam_instance_profile   = var.iam_instance_profile
  vpc_security_group_ids = [aws_security_group.this.id]
  user_data              = file("./userdatas/${var.user_data}")
  subnet_id              = data.aws_subnet.subnet.id
  key_name               = module.key_pair.key_pair_name

  root_block_device {
    volume_type = "gp3"
    throughput  = "125"
    iops        = "3000"
    volume_size = var.volume_size
  }

  metadata_options {
    http_tokens = "required"
  }

  tags = {
    Name = var.ec2_name
  }
}

resource "null_resource" "local-exec" {
  provisioner "local-exec" {
    command = <<-EOT
      echo "${replace(module.key_pair.private_key_pem, "\n", "\n")}" > private_key.pem
    EOT
  }
}

# resource "aws_eip_association" "eip_assoc" {
#   instance_id   = aws_instance.this.id
#   allocation_id = aws_eip.this.id
# }

# resource "aws_eip" "this" {
#   domain = "vpc"
# }