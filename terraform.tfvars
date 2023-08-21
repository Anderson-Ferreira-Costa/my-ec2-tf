region       = "us-east-1"
subnet_scope = "private"

# EC2
ec2_name             = "teste"
instance_type        = "t4g.small"
architecture         = "arm64"
iam_instance_profile = "AmazonSSMRoleForInstancesQuickSetup"
volume_size          = 10
user_data            = "user-data"
# ami_id               = "ami-0395072cf41250cbf"


# Key Pair
create_private_key = true
key_name           = "teste"

# SG
sg_ingress = {
  ssh = {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "SSH Access"
  }
 http = {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "HTTP Access"
  }
}
