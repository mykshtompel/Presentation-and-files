provider "aws" {}


resource "aws_instance" "ServerProd" {
  ami           = "ami-0b9064170e32bde34"
  instance_type = "t2.micro"
  key_name      = "server"

  vpc_security_group_ids = [aws_security_group.SG_ServerProd.id, "sg-11af8958"]
  user_data              = file("user_data.sh")

  tags = {
    Name    = "ServerProd"
    Owner   = "Mykola Shtompel"
    Project = "ServerProd by Terraform 2"
  }
}


resource "aws_security_group" "SG_ServerProd" {
  name        = "Security Group ServerProd"
  description = "Security Group ServerProd Description"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "SG_ServerProd"
  }
}




output "instance_public_ip" {
  description = "Public IP address of the EC2 instance"
  value       = aws_instance.ServerProd.public_ip
}
