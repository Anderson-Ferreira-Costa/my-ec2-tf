module "ec2" {
  source = "./module"

# Region 
region       = "ca-central-1"
subnet_scope = "SINAPSE-EKS-PRD-DR-private-ca-central-1a"

# EC2
ec2_name             = "mongomirror"
instance_type        = "t3a.xlarge"
architecture         = "x86_64"
iam_instance_profile = "AmazonSSMRoleForInstancesQuickSetup"
volume_size          = 500
user_data            = "mongomirror.sh"
ami_id               = "ami-08b4f41bc0ef01469"


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