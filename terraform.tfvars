# Region 
region       = "us-east-1"
subnet_scope = "public"

# EC2
ec2_name             = "my-ec2"
instance_type        = "t4g.small"
architecture         = "arm64"
iam_instance_profile = "AmazonSSMManagedInstanceCore"
volume_size          = 10
user_data            = "cloud-init.yaml"
# ami_id               = "ami-0395072cf41250cbf"


# Key Pair
create_private_key = true
key_name           = "my-key"

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
