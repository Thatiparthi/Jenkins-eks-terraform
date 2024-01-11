module "ec2_instance" {
  source = "terraform-aws-modules/ec2-instance/aws"

  name = "test-server"

  instance_type               = var.instance_type
  key_name                    = var.key_name
  monitoring                  = true
  vpc_security_group_ids      = [module.sg.security_group_id]
  subnet_id                   = module.vpc.public_subnets[0]
  associate_public_ip_address = true
  user_data                   = file("test-install.sh")


  tags = {
    Name        = "test-server"
    Terraform   = "true"
    Environment = "var.environmet"
  }
}