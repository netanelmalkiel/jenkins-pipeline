provider "aws" {
  region                  = "us-east-1"
}


####################################################
module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 3.0"

  name = "server_1"

  ami                    = "ami-052efd3df9dad4825"
  instance_type          = "t2.micro"
  key_name               = "key_july"
  monitoring             = true
  vpc_security_group_ids = [aws_security_group.sg_jenkins.id]

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}

###################################################

resource "aws_security_group" "sg_jenkins" {
  name        = "sg_jenkins"
  description = "Security Group"
  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
}
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
}

  egress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
}
}


