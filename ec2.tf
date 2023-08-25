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

resource "aws_instance" "this" {
  ami                    = var.ami_id != null ? var.ami_id : data.aws_ami.am2.id
  instance_type          = var.instance_type
  iam_instance_profile   = var.iam_instance_profile
  vpc_security_group_ids = [aws_security_group.this.id]
  user_data              = file(var.user_data)
  subnet_id              = data.aws_subnet.subnet.id
  key_name               = module.key_pair.key_pair_name

  root_block_device {
    volume_type = "gp3"
    volume_size = var.volume_size
  }

  metadata_options {
    http_tokens = "required"
  }
  tags = {
    Name = var.ec2_name
  }
}

resource "aws_eip_association" "eip_assoc" {
  instance_id   = aws_instance.this.id
  allocation_id = aws_eip.this.id
}

resource "aws_eip" "this" {
  vpc = true
}