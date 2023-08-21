terraform {
  backend "s3" {
    bucket  = "anderson-ferreira"
    key     = "terraform-state/ec2/terraform.tfstate"
    region  = "us-east-1"
    profile = "anderson"
  }
}