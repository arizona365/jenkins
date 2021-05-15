region = "us-west-1"
vpc_name   = "my-vpc"
cidr_vpc   = "10.0.0.0/16"

azs             = ["us-west-1a", "us-west-1c"]
private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
public_subnets  = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]
