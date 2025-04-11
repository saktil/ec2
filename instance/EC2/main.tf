module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "5.7.1"
  providers = {
    aws = aws.leo
  }

  name = "reverse-proxy-test"

  instance_type          = "t3.micro"
  key_name               = "leo-key"
  monitoring             = false
  vpc_security_group_ids = ["sg-0c5031ba384152ddf"]
  create_eip             = true
  ami                    = "ami-0d22ac6a0e117cefe"
  user_data              = filebase64("${path.module}/scripts/user_data.sh")
  subnet_id              = "subnet-0d720536b03dd931e"
  metadata_options       = {
    http_tokens = "required"
  }
  ebs_block_device       = [
    {
      device_name = "/dev/sda1"
      volume_size = 8
      volume_type = "gp2"
      delete_on_termination = true
    }
  ]

  tags = {
    Terraform   = "true"
    Environment = "test"
  }
}