module "key_pair" {
  source             = "terraform-aws-modules/key-pair/aws"
  key_name           = var.key_name
  create_private_key = var.create_private_key
}

resource "aws_secretsmanager_secret" "this" {
  name                    = "${module.key_pair.key_pair_name}-${random_string.suffix.result}.pem"
  recovery_window_in_days = 7
}

resource "aws_secretsmanager_secret_version" "this" {
  secret_id     = aws_secretsmanager_secret.this.name
  secret_string = module.key_pair.private_key_pem
}

resource "random_string" "suffix" {
  length  = 4
  special = false
}