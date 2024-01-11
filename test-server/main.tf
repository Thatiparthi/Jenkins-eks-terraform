### VPC CREASTION ##########
module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "test-vpc"
  cidr = var.vpc_cidr

  azs = data.aws_availability_zones.azs.names

  public_subnets          = var.public_subnets
  map_public_ip_on_launch = true
  enable_dns_hostnames    = true


  tags = {
    Name        = "test-vpc"
    Terraform   = "true"
    Environment = "var.environment"
  }
  public_subnet_tags = {
    Name = "test-subnet-pub"
  }

}

### Security Groups #####

module "sg" {
  source = "terraform-aws-modules/security-group/aws"

  name        = "test-sg"
  description = "Security group for user-service with custom ports open within VPC, and PostgreSQL publicly open"
  vpc_id      = module.vpc.vpc_id

  ingress_with_cidr_blocks = [
    {
      from_port   = 8080
      to_port     = 8080
      protocol    = "tcp"
      description = "http"
      cidr_blocks = "0.0.0.0/0"
    },

    {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      description = "ssh"
      cidr_blocks = "0.0.0.0/0"
    }
  ]

  egress_with_cidr_blocks = [

    {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      description = "allow all traffic"
      cidr_blocks = "0.0.0.0/0"
    }
  ]

  tags = {
    Name = "test-sg"
  }

}