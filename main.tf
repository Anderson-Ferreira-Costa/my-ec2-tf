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
  ec2_name             = "win-jmeeter"
  instance_type        = "t3a.2xlarge"
  architecture         = "x86_64"
  iam_instance_profile = "AmazonSSMRoleForInstancesQuickSetup"
  volume_size          = 100
  user_data            = "userdata.sh"

  # Key Pair
  create_private_key = true
  key_name           = "my-key-win"

  # SG
  sg_ingress = {
    rdp = {
      from_port   = 3389
      to_port     = 3389
      protocol    = "tcp"
      cidr_blocks = ["10.0.0.0/8", "172.16.0.0/12", "192.168.0.0/16"]
      description = "RDP Access"
    }
    # ssh = {
    #   from_port   = 22
    #   to_port     = 22
    #   protocol    = "tcp"
    #   cidr_blocks = ["10.0.0.0/8", "172.16.0.0/12", "192.168.0.0/16"]
    #   description = "SSH Access"
    # }
  }
}