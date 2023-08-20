region    = "us-east-1"
vpc_id    = "vpc-059f8acdcbf174561"
subnet_id = "subnet-087d2c41385a816f6"

ec2_name             = "script-python"
key_name             = "script-python"
# ami_id               = "ami-0395072cf41250cbf"
instance_type        = "t4g.micro"
architecture         = "arm64"
iam_instance_profile = "AmazonSSMRoleForInstancesQuickSetup"
volume_size          = 10

