# Region 
locals {
  region = "us-east-1"
}

module "ec2" {
  source = "./module"

# Subnet 
region       = local.region
subnet_scope = "Private-2"

# EC2
ec2_name             = "mongo-tools"
instance_type        = "t3a.2xlarge"
architecture         = "x86_64"
iam_instance_profile = "AmazonSSMRoleForInstancesQuickSetup"
volume_size          = 2000
user_data            = "mongo.sh"

# Key Pair
create_private_key = true
key_name           = "my-key"

# SG
sg_ingress = {
  # ssh = {
  #   from_port   = 22
  #   to_port     = 22
  #   protocol    = "tcp"
  #   cidr_blocks = ["0.0.0.0/0"]
  #   description = "SSH Access"
  # }
  # http = {
  #   from_port   = 80
  #   to_port     = 80
  #   protocol    = "tcp"
  #   cidr_blocks = ["0.0.0.0/0"]
  #   description = "HTTP Access"
  # }
}
}