resource "aws_secretsmanager_secret" "this" {
  name                    = "${module.key_pair.key_pair_name}.pem"
  recovery_window_in_days = 30
}
resource "aws_secretsmanager_secret_version" "this" {
  secret_id     = aws_secretsmanager_secret.this.name
  secret_string = module.key_pair.private_key_pem
}